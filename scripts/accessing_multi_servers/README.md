# Multi-Server Access Script

## Description

This bash script automates the process of connecting to multiple EC2 instances, executing a series of commands on each server, and logging the output. It demonstrates how to use SSH to connect to remote servers and execute commands without manual intervention.

## Features

- Connects to three different EC2 instances
- Switches to root user on each server
- Executes common Linux commands (cat /etc/passwd, date, hostname)
- Logs the output of each server to separate files

## Prerequisites

- Bash shell
- SSH client
- Access to the EC2 instances specified in the script
- Corresponding .pem key files for each EC2 instance

## Configuration

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



echo -e "###########connecting to linux_server_1################\n" >>file1 #instead of file1 give your server1 ip address as name of file that saves the details of server 1

ssh -i "$KEY_FILE_1" $SERVER_USERNAME_1@$PUBLIC_DNS_1<<EOF >> file1 #instead of file1 give your server1 ip address as name of file that saves the details of server 1


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

echo -e "#########connecting to linux_server_2##################\n" >> file2 #instead of file2 give your server2 ip address as name of file that saves the details of server 2

ssh -i "$KEY_FILE_2" $SERVER_USERNAME_2@$PUBLIC_DNS_2<<EOF >> file2 #instead of file2 give your server2 ip address as name of file that saves the details of server 2

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

echo -e "##############connecting to linux_server_3######################\n" >> file3 #instead of file3 give your server3 ip address as name of file that saves the details of server 3


ssh -i "$KEY_FILE_3" $SERVER_USERNAME_3@$PUBLIC_DNS_3<<EOF >> file3 #instead of file3 give your server3 ip address as name of file that saves the details of server 3


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





## Usage

1. Ensure you have the necessary .pem files in the same directory as the script:
   - ec2_linux_1.pem
   - ec2_linux_2.pem
   - ec2_linux_3.pem

2. Make the script executable:

   chmod +x script_name.sh


3. Run the script:
   
   ./script_name.sh
   

## Output

The script generates three output files:
- ip_172_31 8_163: Contains output from the first server (13.211.219.173)
- ip_54_153_131_173: Contains output from the second server (54.153.131.173)
- ip_3_25_77_22: Contains output from the third server (3.25.77.22)

Each file contains the following information for its respective server:
- Contents of /etc/passwd file
- Current date and time
- Hostname

## Security Considerations

- This script uses sudo to gain root access. Ensure this aligns with your security policies.
- .pem files should be kept secure and not shared.
- Consider using SSH key forwarding instead of copying .pem files to intermediate servers.

## Customization

You can modify the script to:
- Add or remove servers
- Change the commands executed on each server
- Alter the output file names or format

## Troubleshooting

If you encounter issues:
- Verify that the EC2 instances are running and accessible
- Check that the .pem files have the correct permissions (typically 400)
- Ensure your IP is allowed in the security groups of the EC2 instances

## Disclaimer

This script is provided as-is. Always test scripts in a safe environment before using them in production.
