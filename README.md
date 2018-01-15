# tools
Various tools used to run donkey and race

* wpa_supplicant.conf
This is a sample to use when flashing donkey micro sdcard to gain access to Winet or your favorite Wifi hotspot

* ip2slack.sh
This script can help you to guess the IP address of your Donkey. It will sent at startup your IP address to a Slack channel.
(change the `<your Slack weebhook URL>` in ther script by your how Webhook)

To run the ip2slack script at startup, edit crontab table

```sh
crontab -e

@reboot     /home/pi/ip2slack.sh
```
* emergencyStop.py
A simple script to broadcast emergency stop signal (network must accept local broadcast)

* camstream.sh
A script to connect and stream video from a YI 2K Action Camera to a VLC, VLC being launched to display AND record video stream

* Data visualisation and model training.ipynb
A Jupyter notebook to analyse data, run training and prediction

