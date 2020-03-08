/*
  Copyright (c) 2018.

  Juergen Key. Alle Rechte vorbehalten.

  Weiterverbreitung und Verwendung in nichtkompilierter oder kompilierter Form,
  mit oder ohne Veraenderung, sind unter den folgenden Bedingungen zulaessig:

   1. Weiterverbreitete nichtkompilierte Exemplare muessen das obige Copyright,
  die Liste der Bedingungen und den folgenden Haftungsausschluss im Quelltext
  enthalten.
   2. Weiterverbreitete kompilierte Exemplare muessen das obige Copyright,
  die Liste der Bedingungen und den folgenden Haftungsausschluss in der
  Dokumentation und/oder anderen Materialien, die mit dem Exemplar verbreitet
  werden, enthalten.
   3. Weder der Name des Autors noch die Namen der Beitragsleistenden
  duerfen zum Kennzeichnen oder Bewerben von Produkten, die von dieser Software
  abgeleitet wurden, ohne spezielle vorherige schriftliche Genehmigung verwendet
  werden.

  DIESE SOFTWARE WIRD VOM AUTOR UND DEN BEITRAGSLEISTENDEN OHNE
  JEGLICHE SPEZIELLE ODER IMPLIZIERTE GARANTIEN ZUR VERFUEGUNG GESTELLT, DIE
  UNTER ANDEREM EINSCHLIESSEN: DIE IMPLIZIERTE GARANTIE DER VERWENDBARKEIT DER
  SOFTWARE FUER EINEN BESTIMMTEN ZWECK. AUF KEINEN FALL IST DER AUTOR
  ODER DIE BEITRAGSLEISTENDEN FUER IRGENDWELCHE DIREKTEN, INDIREKTEN,
  ZUFAELLIGEN, SPEZIELLEN, BEISPIELHAFTEN ODER FOLGENDEN SCHAEDEN (UNTER ANDEREM
  VERSCHAFFEN VON ERSATZGUETERN ODER -DIENSTLEISTUNGEN; EINSCHRAENKUNG DER
  NUTZUNGSFAEHIGKEIT; VERLUST VON NUTZUNGSFAEHIGKEIT; DATEN; PROFIT ODER
  GESCHAEFTSUNTERBRECHUNG), WIE AUCH IMMER VERURSACHT UND UNTER WELCHER
  VERPFLICHTUNG AUCH IMMER, OB IN VERTRAG, STRIKTER VERPFLICHTUNG ODER
  UNERLAUBTE HANDLUNG (INKLUSIVE FAHRLAESSIGKEIT) VERANTWORTLICH, AUF WELCHEM
  WEG SIE AUCH IMMER DURCH DIE BENUTZUNG DIESER SOFTWARE ENTSTANDEN SIND, SOGAR,
  WENN SIE AUF DIE MOEGLICHKEIT EINES SOLCHEN SCHADENS HINGEWIESEN WORDEN SIND.
*/

#define AT_HOME 1
#define REGELBETRIEB 1

#include <FS.h> //this needs to be first, or it all crashes and burns...

#include <ESP8266WiFi.h>
#include <WiFiClient.h>
#include <ESP8266WebServer.h>
#include <ESP8266mDNS.h>
#include <WiFiUdp.h>
//needed for wifimanager
#include <DNSServer.h>
#include <WiFiManager.h>          //https://github.com/tzapu/WiFiManager

//
// Debug messages over the serial console.
//
#include "debug.h"

#include <WiFiUdp.h>
#include <stdio.h>
#include <user_interface.h>
#include <ArduinoJson.h>          // https://github.com/bblanchon/ArduinoJson
#include "wifi_security.h"

/** Application*/
#include <PubSubClient.h>
#include <Wire.h>
#include <Adafruit_ADS1015.h>
/* Application*/


/**
  Random Number Generator 32bit
  http://esp8266-re.foogod.com/wiki/Random_Number_Generator
 **/
#define RANDOM_REG32  ESP8266_DREG(0x20E44)
/** Application*/
const char* MQTT_BROKER = "192.168.10.2";
/* Application*/
 
ESP8266WebServer* server;

bool lamp = 0;

char port[6] = "80";

//flag for saving data
bool shouldSaveConfig = false;

int gpio0Switch = D0;

unsigned long previousMillis = 0;

/** Application*/
WiFiClient espClient;
PubSubClient client(espClient);
Adafruit_ADS1115 ads(0x48);
int16_t adc48[4];
/* Application*/

//callback notifying us of the need to save config
void saveConfigCallback ()
{
  Serial.println("Should save config");
  shouldSaveConfig = true;
}


void setup(void)
{
  randomSeed(RANDOM_REG32);
  rst_info *resetInfo;
  resetInfo = ESP.getResetInfoPtr();
  Serial.begin(115200);
  // delay(5000);
  //  Serial.println("");
  //clean FS, for testing
  //SPIFFS.format();
  pinMode(gpio0Switch, INPUT_PULLUP); // Push Button for GPIO0 active LOW

  String realSize = String(ESP.getFlashChipRealSize());
  String ideSize = String(ESP.getFlashChipSize());
  bool flashCorrectlyConfigured = realSize.equals(ideSize);

  //read configuration from FS json
  Serial.println("mounting FS...");

  //  if(flashCorrectlyConfigured)
  {
    if (SPIFFS.begin())
    {
      Serial.println("mounted file system");
      if (SPIFFS.exists("/config.json"))
      {
        //file exists, reading and loading
        Serial.println("reading config file");
        File configFile = SPIFFS.open("/config.json", "r");
        if (configFile)
        {
          Serial.println("opened config file");
          size_t size = configFile.size();
          // Allocate a buffer to store contents of the file.
          std::unique_ptr<char[]> buf(new char[size]);

          configFile.readBytes(buf.get(), size);
          DynamicJsonBuffer jsonBuffer;
          JsonObject& json = jsonBuffer.parseObject(buf.get());
          json.printTo(Serial);
          if (json.success())
          {
            Serial.println("\nparsed json");
/*            strcpy(port, json["port"]);
            strcpy(host, json["host"]);
            strcpy(path, json["path"]);
*/          }
          else
          {
            Serial.println("failed to load json config");
          }
        }
      }
    }
    else
    {
      Serial.println("failed to mount FS");
    }
    //end read
  }
  //  else
  //    else Serial.println("flash incorrectly configured, SPIFFS cannot start, IDE size: " + ideSize + ", real size: " + realSize);



  WiFi.persistent(true);
  WiFi.mode(WIFI_OFF);
  WiFi.mode(WIFI_STA);
#ifdef REGELBETRIEB
  Serial.println(digitalRead(gpio0Switch) == HIGH ? "HIGH" : "LOW");
  if (digitalRead(gpio0Switch) == HIGH)
    WiFi.begin(WiFi.SSID().c_str(), WiFi.psk().c_str()); // reading data from EPROM, (last saved credentials)
  else
  {
    WiFi.persistent(false);
    WiFi.begin("geht", "nicht");
    WiFi.persistent(true);
  }
#else
#ifdef AT_HOME
  WiFi.begin(wifi_ssid,wifi_pwd); // reading data from EPROM, (last saved credentials)
#else 
  WiFi.begin(wifi_ssid_cell_ap,wifi_pwd_cell_ap); // reading data from EPROM, (last saved credentials)
#endif
#endif
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, lamp);

  // Wait for WiFi
  Serial.println("");
  Serial.print("Verbindungsaufbau mit:  ");
  Serial.println(WiFi.SSID().c_str());

  while (WiFi.status() == WL_DISCONNECTED)            // last saved credentials
  {
    delay(500);
    if (lamp == 0)
    {
      digitalWrite(LED_BUILTIN, 1);
      lamp = 1;
    }
    else
    {
      digitalWrite(LED_BUILTIN, 0);
      lamp = 0;
    }
    Serial.print(".");
  }
  lamp = 0;
  digitalWrite(LED_BUILTIN, 0);

  wl_status_t status = WiFi.status();
  if (status == WL_CONNECTED)
  {
    Serial.printf("\nConnected successful to SSID '%s'\n", WiFi.SSID().c_str());
  }
  else
  {
    WiFi.mode(WIFI_OFF);
    //WiFiManager
    //Local intialization. Once its business is done, there is no need to keep it around
    WiFiManager wifiManager;
    //set config save notify callback
    wifiManager.setSaveConfigCallback(saveConfigCallback);

/*    WiFiManagerParameter custom_port("Port", "Port", port, 5);
    WiFiManagerParameter custom_host("Host", "Host", host, 99);
    WiFiManagerParameter custom_path("Path", "Path", path, 99);
    wifiManager.addParameter(&custom_port);
    wifiManager.addParameter(&custom_host);
    wifiManager.addParameter(&custom_path);
*/
    //reset settings - for testing
    //wifiManager.resetSettings();

    //sets timeout until configuration portal gets turned off
    //useful to make it all retry or go to sleep
    //in seconds
    digitalWrite(LED_BUILTIN, LOW);

    //fetches ssid and pass and tries to connect
    //if it does not connect it starts an access point with the specified name
    //here  "AutoConnectAP_12F647"
    //and goes into a blocking loop awaiting configuration
    if (!wifiManager.autoConnect("AutoConnectAP_steuerpult"))
    {
      WiFi.mode(WIFI_OFF);
      WiFi.mode(WIFI_STA);
      digitalWrite(LED_BUILTIN, HIGH);
      // WPS button I/O setup
      /*      Serial.printf("\nCould not connect to WiFi. state='%d'\n", status);
            Serial.println("Please press WPS button on your router, until mode is indicated.");
            Serial.println("next press the ESP module WPS button, router WPS timeout = 2 minutes");

            while(digitalRead(gpio0Switch) == HIGH)  // wait for WPS Button active
            {
              delay(50);
              if(lamp == 0){
                 digitalWrite(LED_BUILTIN, 1);
                 lamp = 1;
               }else{
                 digitalWrite(LED_BUILTIN, 0);
                 lamp = 0;
              }
              Serial.print(".");
              yield(); // do nothing, allow background work (WiFi) in while loops
            }
            Serial.println("WPS button pressed");
            lamp=0;
            digitalWrite(LED_BUILTIN, 0);

            if(!startWPSPBC()) {
               Serial.println("Failed to connect with WPS :-(");
            } else*/
      {
        WiFi.begin(WiFi.SSID().c_str(), WiFi.psk().c_str()); // reading data from EPROM,
        while (WiFi.status() == WL_DISCONNECTED)            // last saved credentials
        {
          delay(500);
          Serial.print("."); // show wait for connect to AP
        }
      }
    }
    else
    {
  /*    Serial.println(custom_port.getValue());
      Serial.println(custom_host.getValue());
      Serial.println(custom_path.getValue());
      strcpy(port, custom_port.getValue());
      strcpy(host, custom_host.getValue());
      strcpy(path, custom_path.getValue());
*/
      //save the custom parameters to FS
      if (shouldSaveConfig)
      {
        Serial.println("saving config");
        DynamicJsonBuffer jsonBuffer;
        JsonObject& json = jsonBuffer.createObject();
/*        json["host"] = host;
        json["port"] = port;
        json["path"] = path;
*/
        File configFile = SPIFFS.open("/config.json", "w");
        if (!configFile)
        {
          Serial.println("failed to open config file for writing");
        }

        json.printTo(Serial);
        json.printTo(configFile);
        configFile.close();
        //end save
      }

    }
  }




  Serial.println("Verbunden");
  Serial.print("IP-Adresse: ");
  Serial.println(WiFi.localIP());

  Serial.println("Led aus!");
  digitalWrite(LED_BUILTIN, HIGH);

//  ESP.deepSleep((massaged - local) * 1e06); // 20e6 is 20 microseconds
/** Application*/
    client.setServer(MQTT_BROKER, 1883);
    ads.begin();
/* Application*/

}

/** Application*/
void reconnect() {
    while (!client.connected()) {
        Serial.print("Reconnecting...");
        if (!client.connect("ESP8266Client")) {
            Serial.print("failed, rc=");
            Serial.print(client.state());
            Serial.println(" retrying in 5 seconds");
            delay(5000);
        }
    }
}
/* Application*/

void loop(void)
{
    if (!client.connected()) {
        reconnect();
    }
    client.loop();

    for(int i=0;i<4;++i)
    {
      adc48[i]=ads.readADC_SingleEnded(i);
    }
    String msg("");
    DynamicJsonBuffer jsonBuffer;
    JsonObject& json = jsonBuffer.createObject();
    json["adc480"] = adc48[0];
    json["adc481"] = adc48[1];
    json["adc482"] = adc48[2];
    json["adc483"] = adc48[3];
    json.printTo(msg);

    Serial.print("Publish message: ");
    Serial.println(msg.c_str());
    client.publish("home/adc48json", msg.c_str());
    client.publish("home/adc480", String(adc48[0]).c_str());
    client.publish("home/adc481", String(adc48[1]).c_str());
    client.publish("home/adc482", String(adc48[2]).c_str());
    client.publish("home/adc483", String(adc48[3]).c_str());
    delay(500);
}

int getRandomNumber(int startNum, int endNum) {
  return random(startNum, endNum);
}



