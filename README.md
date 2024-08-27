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

-Operating System: Linux-based systems are recommended.
-Dependencies:
-tmux for terminal multiplexing
-df for disk space information
-bash or zsh for scripting

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

Steps for launching and connecting to EC2 :

Step 1: Sign in to your AWS account

Before you can set up an EC2 instance with Amazon Linux, you need an AWS account.
First, go to the URL https://aws.amazon.com and click on the button that says “Sign in to the console.
Here you can select whether you want to log in as a Root user or an IAM user:
Your choice of user login should consider your account’s configuration and the existing user permissions. However, it is recommended to log in as a user with the lowest level of access privileges for best security practices.
If you don’t have an AWS account, you can create one as you are often entitled to free tier benefits that you can use.
Step 2: Launch an EC2 instance
Once you have logged into your AWS account, in the search bar you can type EC2 in order to access the main page for provisioning and management.
Next, under Instances, you can select the option “Launch Instances.”


We will land on the new page where we can select additional options, such as the Name of our instance, Application, and OS Images for our instance and we will select the default option — Amazon Linux.

When we scroll below we can choose the type of our instance. Amazon Linux has a minimum requirement of 512MB of RAM and 1 CPU core, so if we are testing things, we can select the t2.micro instance which fits into the free tier in AWS.
When you have a project and instance that should be production-ready, you can select instances with more RAM and CPU power, by choosing from the dropdown list.
Next, we will make sure to create a new security group for our instance.
Creating a new security group for your new EC2 instance is a fundamental security best practice in AWS. It allows you to define and enforce customized network access controls, adhere to the least privilege principle, and maintain better isolation and security for your EC2 instances.

You should add the Key pair name and also the Key pair type which can be RSA or ED25519.

In general, both RSA and ED25519 are strong choices for SSH key authentication. The decision between them should consider your security requirements, compatibility needs, and the level of trust you place in modern cryptographic algorithms. For most use cases, either option will provide secure authentication when used correctly. RSA is one of the oldest and most widely supported SSH key algorithms, making it compatible with a wide range of SSH servers and clients while ED25519 keys are a good choice when security is a top priority and compatibility with older systems is not a concern.
We can select Private key file format which can be either in .pem format or .ppk in case you use a Windows SSH client such as PuTTy.
In our case, we will select the .pem format since we will be using the terminal.
Finally, click on the “Create key pair” option in order to generate the SSH key and this will prompt the download in your browser. Also, there is a warning from AWS that we should store our private keys in a secure and accessible location on our computers.
Further in our setup process, we would need to select our Network Settings.
For the first option, we need to access our EC2 instance through SSH but instead of allowing SSH traffic from “0.0.0.0/0” (which means from anywhere), restrict it to only allow connections from specific trusted IP addresses or ranges. This limits the exposure of your SSH port to the internet and reduces the risk of unauthorized access. You can also use CIDR notation to specify the IP ranges

Next, we will select our storage options from the menu:

In this case, we have selected a new volume with 8 GB of storage with the general purpose, gp3 type of volume. For production purposes, make sure to increase the size of the volume based on your needs. In general, gp3 EBS volumes offer more flexibility, burst performance, and often a lower cost per gigabyte compared to gp2 volumes. When selecting between them, consider your application’s specific I/O and performance needs, as well as your budget constraints.
Our final step is confirming the selected options in the summary and we can proceed to launch the instance.
You will get the notification that the instance is successfully launched and you’ll return to your Instances list.
After a short wait, typically with a fast provisioning time, you’ll be able to locate your instance in the list.



Step 3: Connect to your Amazon Linux instance
Now the next step is to connect to the instance via SSH. We can do so by using our Instances menu and clicking Connect
Here we will see a new menu where we will select the SSH client menu item

After opening your terminal and finding where you have downloaded the .pem key, it is important to change permissions to it, for security reasons, so that the key is not publicly viewable, and in our case, we will run the following command
chmod 400 “aws_ec2_linux.pem”
Next, we will use the SSH key to connect to our instance:
ssh -i “aws_ec2_linux.pem” ec2-user@ec2-3-79-150-186.eu-central-1.compute.amazonaws.com
Here, the -i flag in SSH is used to specify the path to the private key file to be used for authentication when connecting to a remote server. It allows you to choose a specific key file when you have multiple key pairs or non-standard key file names and locations.
When we log into our Amazon Linux instance for the first time, we need to confirm the authenticity of the host. Here you can type yes and press Enter.
After this action, we will be logged into our instance

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
Pane 0: CPU health check (mpstat)
Pane 1: Disk usage (df -h)
Pane 2: Memory usage (free -h)
Pane 3: Running processes (ps aux)
Pane 4: System uptime (uptime)
Pane 5: Critical errors in system logs (journalctl -p 3 -xb)
Pane 6: Network interface status (ip a)

## Customization

To modify the pane layout or commands, edit the start_monitoring.sh script:
- Splitting Panes: Adjust tmux split-window commands.
- Commands in Panes: Update tmux send-keys commands.

## Troubleshooting

Issue: tmux or other commands not found.
- Solution: Ensure all dependencies are installed.
Issue: Information not updating.
- Solution: Verify commands and utilities outside of tmux.













