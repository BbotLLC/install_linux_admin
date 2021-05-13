#!/bin/bash
sudo apt-get update
sudo apt-get install landscape-client -y


name=$(getent passwd $USER | cut -d : -f5 | cut -d, -f1)
sudo rm /etc/landscape/client.conf

sudo tee -a /etc/landscape/client.conf > /dev/null <<EOT
[client]
log_level = info
url = https://landscape.canonical.com/message-system
ping_url = http://landscape.canonical.com/ping
data_path = /var/lib/landscape/client
account_name = apbbotmenu
registration_key = asdjfhasdfuyweeuw26521367sadjw328723dsfas
computer_title = ${name}
script_users = ALL
include_manager_plugins = ScriptExecution
access_group = employees
EOT
