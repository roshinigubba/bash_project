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













