#!/usr/bin/expect
set timeout 9
set systemTime [clock seconds]

send_user "\nConnecting to cam\n"
set camIp 192.168.42.1
set camPort 7878


spawn nc -vvn $camIp $camPort

expect {
  timeout { send_user "\nFailed to connect to cam (timeout)\n"; exit 1 }
  eof { send_user "\nNC failure to connect to cam $camIp\n"; exit 1 }
  "succeeded!"
}

sleep 1
send "{\"msg_id\":257, \"token\":0,\"param\":0}\r"

expect {
  timeout { send_user "\nFailed to get cnx id (timeout)\n"; exit 1 }
  eof { send_user "\nNC failure to get cnx id $camIp\n"; exit 1 }
  -re "\"msg_id\": 257, \"param\": (\[0-9]+)" {set cnx $expect_out(1,string); send_user "Got $cnx :)"}
}

sleep 1
send "{\"msg_id\":259,\"token\":$cnx,\"param\":\"none_force\"}\r"

expect {
  timeout { send_user "\nFailed to get cnx id (timeout)\n"; exit 1 }
  eof { send_user "\nNC failure to get cnx id $camIp\n"; exit 1 }
  -re "\"type\": \"vf_start\"" {}
}

send_user "Streaming started successfully, connect to rtsp://192.168.42.1/live"

#exec /Applications/VLC.app/Contents/MacOS/VLC --network-caching 0 rtsp://192.168.42.1/live --sout file/ps:live-$systemTime.mpg --sout-display
exec /Applications/VLC.app/Contents/MacOS/VLC rtsp://192.168.42.1/live --sout file/ps:live-$systemTime.mpg --sout-display

expect {
    eof { send_user "\nNC failure to get cnx id $camIp\n"; exit 1 }
    timeout { exp_continue}
 }

