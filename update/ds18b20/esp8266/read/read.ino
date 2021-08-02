
#include <ESP8266WiFi.h>
#include "ESP8266WebServer.h"
#include <OneWire.h>
#include <DallasTemperature.h>

ESP8266WebServer server(80);

const char* ssid = "PUT_HERE_YOUR_SSID"; //Enter SSID
const char* password = "PUT_HERE_PASSWORD"; //Enter Password

// GPIO where the DS18B20 is connected to
const int oneWireBus = 4;     

// Setup a oneWire instance to communicate with any OneWire devices
OneWire oneWire(oneWireBus);

// Pass our oneWire reference to Dallas Temperature sensor 
DallasTemperature sensors(&oneWire);

void setup() {
  // Start the Serial Monitor
  Serial.begin(115200);
  // Start the DS18B20 sensor
  sensors.begin();
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
  sensors.requestTemperatures(); 
  float temperatureC = sensors.getTempCByIndex(0);
  server.send(200, "text/plain", String(temperatureC).c_str());
}

void loop() {
  server.handleClient();
}
