#!/bin/bash/

PUBLIC_DNS_1="your_public_dns"  # Enter your 1st server public ipaddress
SERVER_USERNAME_1="your_username" #Enter your 1st server username
KEY_FILE_1="/path/to/key_file_1" #Enter the path to your pem file of 1st server 

PUBLIC_DNS_2="your_public_dns"  # Enter your 2nd server public ipaddress
SERVER_USERNAME_2="your_username" #Enter your 2nd server username
KEY_FILE_2="/path/to/key_file_2" #Enter the path to your pem file of 2nd server


PUBLIC_DNS_3="your_public_dns"  # Enter your 3rd server public ipaddress
SERVER_USERNAME_3="your_username" #Enter your 3rd server username
KEY_FILE_3="/path/to/key_file_3" #Enter the path to your pem file of 3rd server


echo -e "###########connecting to linux_server_1################\n" >> file1 #instead of file1 give your server1 ip address as name of file that saves the details of server 1

ssh -i "$KEY_FILE_1" $SERVER_USERNAME_1@$PUBLIC_DNS_1 <<EOF >> file1 #instead of file1 give your server1 ip address as name of file that saves the details of server 1

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

echo -e "#########connecting to linux_server_3##################\n" >>file2 #instead of file2 give your server2 ip address as name of file that saves the details of server 2 

ssh -i "$KEY_FILE_2" $SERVER_USERNAME_2@$PUBLIC_DNS_2 <<EOF >>file2 #instead of file2 give your server2 ip address as name of file that saves the details of server 2

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

EOF

echo -e "\n"

echo -e "##############connecting to linux_server_4####################\n" >> file3 #instead of file3 give your server3 ip address as name of file that saves the details of server 3

ssh -i "$KEY_FILE_3" $SERVER_USERNAME_3@$PUBLIC_DNS_3 <<EOF >> file3 #instead of file3 give your server3 ip address as name of file that saves the details of server 3

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


