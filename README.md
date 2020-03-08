# esp8266steuerpult

<!---
[![start with why](https://img.shields.io/badge/start%20with-why%3F-brightgreen.svg?style=flat)](http://www.ted.com/talks/simon_sinek_how_great_leaders_inspire_action)
--->
[![GitHub release](https://img.shields.io/github/release/elbosso/esp8266steuerpult/all.svg?maxAge=1)](https://GitHub.com/elbosso/esp8266steuerpult/releases/)
[![GitHub tag](https://img.shields.io/github/tag/elbosso/esp8266steuerpult.svg)](https://GitHub.com/elbosso/esp8266steuerpult/tags/)
[![GitHub license](https://img.shields.io/github/license/elbosso/esp8266steuerpult.svg)](https://github.com/elbosso/esp8266steuerpult/blob/master/LICENSE)
[![GitHub issues](https://img.shields.io/github/issues/elbosso/esp8266steuerpult.svg)](https://GitHub.com/elbosso/esp8266steuerpult/issues/)
[![GitHub issues-closed](https://img.shields.io/github/issues-closed/elbosso/esp8266steuerpult.svg)](https://GitHub.com/elbosso/esp8266steuerpult/issues?q=is%3Aissue+is%3Aclosed)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/elbosso/esp8266steuerpult/issues)
[![GitHub contributors](https://img.shields.io/github/contributors/elbosso/esp8266steuerpult.svg)](https://GitHub.com/elbosso/esp8266steuerpult/graphs/contributors/)
[![Github All Releases](https://img.shields.io/github/downloads/elbosso/esp8266steuerpult/total.svg)](https://github.com/elbosso/esp8266steuerpult)
[![Website elbosso.github.io](https://img.shields.io/website-up-down-green-red/https/elbosso.github.io.svg)](https://elbosso.github.io/)

This repository contains software fur re-purposing a vintage control 
unit with numerous analogue and digital inputs and some digital outputs (LEDs).

The Idea was to collect the data from the outputs and to send them via 
MQTT to a broker where subscribers can use them (https://smarthome-blogger.de/tutorial/esp8266-mqtt-tutorial/).

For gathering the analogue data, we will use a ADS1x15 (http://www.esp8266learning.com/ads1115-analog-to-digital-converter-and-esp8266.php)

The data for connecting with your wifi is located in a header file named `wifi_security.h` that i did
not commit for obvious reasons. Its contents look something like the contents of the example named
`wifi_security_h.example`:

```
#ifndef WIFISECURITY_H
#define WIFISECURITY_H

char wifi_ssid[]="<wifi_ssid>";
char wifi_pwd[]="<wifi_pwd>";
char wifi_ssid_cell_ap[]="<wifi_ssid_cell_ap>";
char wifi_pwd_cell_ap[]="<wifi_pwd_cell_ap>";

#endif /* WIFISECURITY_H */
```

The define `AT_HOME` is used to control what NTP-server should be used: The source code presumes a local NTP-server 
exists at IP-address `192.168.10.2` if
`AT_HOME` is set to 1 - if this is not so, it currently asks `2.de.pool.ntp.org` for the time.

The define `AT_HOME` also decides which pair of WIFI credentials are to be used.

Instructions for setting up the arduino IDE to actually be able to transfer the code to a Wemos D1 (clone) can be found [here](https://averagemaker.com/2018/03/wemos-d1-mini-setup.html)

