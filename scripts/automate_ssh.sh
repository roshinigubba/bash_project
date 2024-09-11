#!/bin/bash/

echo -e "###########connecting to linux_server_2################\n"

ssh -i "ec2_linux.pem" ec2-user@13.211.219.173<<EOF

echo -e "\n"

echo -e "#################switching to root#####################\n"

sudo -i

echo -e "####################listing the password file content#####################\n"

cat /etc/passwd

echo -e "\n"

echo -e "###########################displaying the date#########################\n"

date

echo -e "\n"

echo -e "##########################displaying the hostname#######################\n"

hostname

EOF

echo -e "\n"

echo -e "#########connecting to linux_server_3##################\n"

ssh -i "ec2_linux_4.pem" ec2-user@54.153.131.173<<EOF

echo -e "\n"

echo -e "#################switching to root#####################\n"

sudo -i

#echo -e "\n"

echo -e "####################listing the password file content#####################\n"

cat /etc/passwd

echo -e "\n"

echo -e "###########################displaying the date#########################\n"

date

echo -e "\n"

echo -e "##########################displaying the hostname#######################\n"

hostname
uname -n

EOF

echo -e "\n"

echo -e "##############connecting to linux_server_4######################\n"

ssh -i "ec2_linux_5.pem" ec2-user@3.25.77.22<<EOF

#echo -e "\n"

echo -e "#################switching to root#####################\n"

sudo -i

echo -e "\n"

echo -e "####################listing the password file content#####################\n"

cat /etc/passwd

echo -e "\n"

echo -e "###########################displaying the date#########################\n"

date

echo -e "\n"

echo -e "##########################displaying the hostname#######################\n"

hostname


EOF



