#!/usr/SAP/hdbclient/Python
import os
import pyhdb
import cgi
import sys
import http.server
import socketserver
import urllib
import json


class PyHandler(http.server.BaseHTTPRequestHandler):
	def do_GET(self):
		self.sendHeader()
		if self.loadParameters() == False:
			self.wfile.write(("Failed to load Parameters\n Please call the api with an ID, ERW and NRW parameter. Example: ?id=42&nrw=50&erw=50\n").encode())
			return
		
		if self.loadHanaSettings() == False:
			self.wfile.write(("Failed to load Hana settings\n").encode())
			return
			
		if self.loadCredentials() == False:
			self.wfile.write(("Failed to load Credentials\n").encode())
			return
		
		conn = pyhdb.connect(self._credentials["host"],self._credentials["port"],self._credentials["user"],self._credentials["password"])
		cursor = conn.cursor()
		sql_to_prepare = 'call "' + self._credentials["schema"] + '"."DKOM_XSJS_SERVICE_1.DB.procedures::get_rating"(?,?,?,?,?)'
		params = {'V_PARTY_ID':self._id,'V_EXTERNAL_RATING_WEIGHT':self._erw,'V_NETWORK_RATING_WEIGHT':self._nrw,'V_RATING':None,'V_MESSAGE':None}
		psid = cursor.prepare(sql_to_prepare)
		ps = cursor.get_prepared_statement(psid)
		cursor.execute_prepared(ps,[params])
		ret = cursor.fetchone()
		self.wfile.write(("{\"V_RATING\":%s,\"V_MESSAGE\":%s}"%(ret[0],ret[1])).encode())
		conn.close()
		
	def loadCredentials(self):
		if "credentials" in self._hana:
			self._credentials = self._hana["credentials"]
			return True
		return False
		
	def loadHanaSettings(self):
		# Try to load hana settings
		try:
			vcap = json.loads(os.environ.get("VCAP_SERVICES"))
			svclist = vcap.get("hana")
			self._hana = svclist[0]
			return True;
		except AttributeError:
			self.wfile.write(("Service module not working\n").encode())
			return False;
		
	def sendHeader(self):
		self.send_response(200)
		self.send_header("Content-Type","application/json")
		self.send_header("charset","iso-8859-15")
		self.end_headers()
		return
	
	def loadParameters(self):
		parameters = urllib.parse.urlparse(self.path)
		parameters = urllib.parse.parse_qs(parameters.query)
		
		if "id" in parameters:
			self._id = str(parameters["id"][0])
		else:
			return False
		
		if "erw" in parameters and "nrw" in parameters:
			self._erw = str(parameters["erw"][0])
			self._nrw = str(parameters["nrw"][0])
		else:
			self._erw = str(50)
			self._nrw = str(50)
		return True
		

port = int(os.environ.get('PORT') or 8080)

try:
	server = http.server.HTTPServer(('',port), PyHandler)
	print('Started httspserver on port ',port)
	server.serve_forever()
except KeyboardInterrupt:
	print('^C received, shutting down the webserver')
	server.socket.close()	