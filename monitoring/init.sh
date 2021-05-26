#!/bin/bash

git clone https://github.com/ytx1991/ChiaMonitor.git /home/chia/ChiaMonitor
rm /home/chia/ChiaMonitor/mtail

wget -c https://github.com/google/mtail/releases/download/v3.0.0-rc45/mtail_3.0.0-rc45_Linux_x86_64.tar.gz -O - | tar -xz -C /home/chia/ChiaMonitor/

wget -O /etc/systemd/system/watch-farmer.service https://raw.githubusercontent.com/iwex/chiascripts/main/monitoring/watch-farmer.service
wget -O /etc/systemd/system/watch-farmer.timer https://raw.githubusercontent.com/iwex/chiascripts/main/monitoring/watch-farmer.timer
wget -O /etc/systemd/system/mtail.service https://raw.githubusercontent.com/iwex/chiascripts/main/monitoring/mtail.service

wget -O /home/chia/watch-farmer.sh https://raw.githubusercontent.com/iwex/chiascripts/main/monitoring/watch-farmer.sh
chmod +x /home/chia/watch-farmer.sh

systemctl daemon-reload

systemctl enable watch-farmer
systemctl enable watch-farmer.timer
systemctl enable mtail

systemctl start watch-farmer.timer
systemctl start mtail
