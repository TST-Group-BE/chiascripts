#!/bin/bash

wget -O /etc/systemd/system/start-harvester.service https://raw.githubusercontent.com/TST-Group-BE/chiascripts/main/harvest/start-harvester.service
systemctl daemon-reload
systemctl enable start-harvester