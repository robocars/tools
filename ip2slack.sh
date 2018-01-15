#!/bin/sh
sleep 15
ip=`/sbin/ifconfig wlan0 | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'`
curl -X POST --data-urlencode "payload={\"text\": \"I'm alive :)\\nConsole SSH ssh://"$ip"\\nController Web http://"$ip":8887.\"}" <your Slack weebhook URL>
