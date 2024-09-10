#!/bin/bash

echo "####################connecting to remote server###############################"

PUBLIC_DNS="your_public_dns"
SERVER_USERNAME="your_username"

ssh -i "/path/to/Key_file" $SERVER_USERNAME@$PUBLIC_DNS<<EOF

echo "###################################################"

echo " switching into root"

echo " ####################################################"

sudo -i

echo "**********************************listing password file content********************************"

cat /etc/passwd

echo "**************************displaying the date************************************"

date

EOF




