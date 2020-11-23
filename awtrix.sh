#!/bin/bash
RED='\033[0;31m'
NC='\033[0m' # No Color
echo
echo "Installation script 0.3 for \e[31mA\e[32mW\e[34mT\e[33mR\e[36mI\e[35mX\e[m Host"
echo "\e[34mby Blueforcer\e[0m" 

sleep 3

if [ "$(id -u)" != "0" ]; then
   echo "This script must be run with sudo. Use \"sudo ${0} ${*}\"" 1>&2
   exit 1
fi

echo
if (systemctl -q is-active awtrix2.service)
    then
    echo "${RED}AWTRIX SERVICE is running. Stopping..${NC}"
    echo
    echo
    systemctl stop awtrix2
    systemctl disable awtrix2
fi

echo "\e[32mUpdating...\e[0m"
apt-get update -y
sudo apt-get install default-jre -y

echo "\e[32mMake Dirs\e[0m"
mkdir -p /root/awtrix1/jar_temp
cd /root//awtrix1/jar_temp
# rm -f /root/jar_temp/awtrix.jar
echo

# 手动下载了jar包，这里就注释掉
:'
echo
if [ "$1" = "beta" ]
  then
    echo "\e[32mDownload beta\e[0m"
    echo
    sleep 1
    wget https://blueforcer.de/awtrix/beta/awtrix.jar
  elif [ "$1" = "nightly" ]
    then
      echo "\e[32mDownload nightly\e[0m"
      echo
      sleep 1
      wget https://blueforcer.de/awtrix/nightly/awtrix.jar
  else
      echo "\e[32mDownload stable\e[0m"
      echo
      sleep 1
      wget https://blueforcer.de/awtrix/stable/awtrix.jar
fi
echo
'

echo
echo "\e[32mcreate Service2\e[0m"

rm -f /etc/systemd/system/awtrix2.service

sudo cat >> /etc/systemd/system/awtrix2.service <<'EOF'
[Unit]
Description=AWTRIX2 HOST
After=network.target

[Service]
WorkingDirectory=/root/awtrix1/jar_temp
Type=simple
ExecStart=/usr/bin/java -jar /root/awtrix1/jar_temp/awtrix.jar
Restart=always
RestartSec=3

[Install]
WantedBy=multi-user.target
EOF
echo

echo "\e[32mStart AWTRIX2 HOST\e[0m"

systemctl daemon-reload
systemctl enable awtrix2
systemctl start awtrix2

echo "\e[32mChecking installation...\e[0m"
sleep 10
if (systemctl -q is-active awtrix2.service) then
  echo
  echo "Installation successful."
  echo
  echo "\e[32mWebinterface http://[Server-IP]:7000\e[0m"
  echo
 else 
 echo "${RED}Installation failed!${NC}"
fi
