
#include <ESP8266WiFi.h>
#include "ESP8266WebServer.h"
#include "DHT.h"

#define DHTPIN 5

ESP8266WebServer server(80);

const char* ssid = "PUT_HERE_YOUR_SSID"; //Enter SSID
const char* password = "PUT_HERE_PASSWORD"; //Enter Password
float currt, currh;

DHT dht(DHTPIN, DHT22);

void setup() {
  // Start the Serial Monitor
  Serial.begin(115200);
  dht.begin();
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) 
  {
     delay(1000);
     Serial.print(".");
  }
  server.on("/", handleTemperature);
  server.begin();
}

void handleTemperature() {
  currt = dht.readTemperature();
  currh = dht.readHumidity();
  String jsonContent = "{\"sensors\": {\"temperature\": ";
  jsonContent += String(currt).c_str();
  jsonContent += ", \"humidity\": ";
  jsonContent += String(currh).c_str();
  jsonContent += "}}";
  server.send(200, "application/json", jsonContent);
}

void loop() {
  server.handleClient();
}
