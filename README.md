# bash_project

## System information:

Configuring the screen into multiple sections, with each section displaying distinct information. Specifically,
- CPU health checks
- Running processes
- System uptime
- Critical errors from system logs
- Memory usage
- Network interface status
- Disk usage

This tool helps you manage multiple system information displays in separate panes on your screen. Ideal for monitoring various system metrics and logs simultaneously.

## Overview

This project provides a way to split your screen into different panes and display various system information in each pane. The information could include CPU health check, memory usage, disk space, network interface status, critical errors in system logs, uptime and more

## Requirements

- Operating System: Linux-based systems are recommended.
- Dependencies:
    - tmux for terminal multiplexing
    - df for disk space information
    - bash or zsh for scripting

## Recommended Modules and Tools

- tmux:
    - Purpose: Terminal multiplexer for creating and managing multiple terminal sessions in one window.
    - Usage: Essential for splitting the terminal screen into multiple panes.
- htop:
    - Purpose: Interactive process viewer and system monitor.
    - Usage: Provides a real-time overview of CPU, memory, and process information.
- df:
    - Purpose: Disk space usage.
    - Usage: Displays available disk space on file systems.
- netstat:
    - Purpose: Network statistics.
    - Usage: Provides detailed network connections, routing tables, interface statistics, masquerade connections, and multicast memberships.
- iostat:
    - Purpose: System I/O statistics.
    - Usage: Reports on CPU statistics and input/output statistics for devices and partitions.
- vnstat:
    - Purpose: Network traffic monitor.
    - Usage: Provides network traffic statistics and can log data over long periods.

## Installation:

- Create an aws account
    - Launch an ec2 instance
    - Connect to your Amazon Linux instance
- Create git account and create a repository named “bash_project”
    - Clone the git repository into our local repository
    - Create two directories named scripts and docs in the local repository and push that directories into git.
- Clone the repository
    - Syntax: git clone git_repository’s_http_link
    - Example: git clone https://github.com/roshinigubba/bash_project.git
- Install dependencies:
    - sudo apt update
    - sudo apt install tmux
    - sudo apt install htop 

## Configuration :

#!/bin/bash

#Start a new tmux session

tmux new-session -d -s system_monitors

#Split the screen into 7 panes

tmux split-window -h   # Split the screen into 2 vertical panes

tmux split-window -v   # Split the top pane into 2 horizontal panes

tmux select-pane -t 0  # Select the first pane (top-left)

tmux split-window -v   # Split the top-left pane into 2 horizontal panes

#Arrange panes

tmux select-pane -t 1

tmux split-window -h   # Split the second vertical pane into 2 vertical panes

#Arrange panes

tmux select-pane -t 2

tmux split-window -v

#Arrange panes

tmux select-pane -t 3

tmux split-window -h


#Set up the layout

tmux select-layout tiled

#Run commands in each pane

tmux select-pane -t 0

tmux send-keys "mpstat" C-m  # CPU health check

tmux select-pane -t 1

tmux send-keys "df -h" C-m  # Disk usage

tmux select-pane -t 2

tmux send-keys "free -h" C-m  # Memory usage

tmux select-pane -t 3

tmux send-keys "ps aux" C-m  # Running processes

tmux select-pane -t 4

tmux send-keys "uptime" C-m  # Uptime

tmux select-pane -t 5

tmux send-keys ""journalctl -p 3 -xb"" C-m  # Critical errors in system logs

tmux select-pane -t 6

tmux send-keys "ip a" C-m  # Network interface status

#Attach to the tmux session

tmux attach-session -t system_monitors


## Usage

1. Run the Script:
 Execute the start_monitoring.sh script to set up the tmux session:
./project1.sh
2. View Panes:
- Pane 0: CPU health check (mpstat)
- Pane 1: Disk usage (df -h)
- Pane 2: Memory usage (free -h)
- Pane 3: Running processes (ps aux)
- Pane 4: System uptime (uptime)
- Pane 5: Critical errors in system logs (journalctl -p 3 -xb)
- Pane 6: Network interface status (ip a)

## Customization

To modify the pane layout or commands, edit the start_monitoring.sh script:
- Splitting Panes: Adjust tmux split-window commands.
- Commands in Panes: Update tmux send-keys commands.

## Troubleshooting

Issue: tmux or other commands not found.
- Solution: Ensure all dependencies are installed.

Issue: Information not updating.
- Solution: Verify commands and utilities outside of tmux.

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












