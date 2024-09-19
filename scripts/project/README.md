# System Monitor Script

## Overview

This Bash script creates a comprehensive system monitoring dashboard using tmux. It splits the terminal into multiple panes, each displaying different system metrics and information.

## Features

The script provides real-time monitoring of various system aspects:

1. CPU health (using `mpstat`)
2. Disk usage (using `df -h`)
3. Memory usage (using `free -h`)
4. Running processes (using `ps aux`)
5. System uptime (using `uptime`)
6. Critical errors in system logs (using `journalctl`)
7. Network interface status (using `ip a`)

## Requirements

- Bash shell
- tmux (terminal multiplexer)
- Standard Unix utilities (mpstat, df, free, ps, uptime, journalctl, ip)

## Usage

1. Save the script to a file, e.g., `system_monitor.sh`
2. Make the script executable:
   
   chmod +x system_monitor.sh
   
3. Run the script:
   
   ./system_monitor.sh
   

## How it works

1. The script starts a new tmux session named "system_monitors".
2. It then splits the screen into 7 panes using a combination of vertical and horizontal splits.
3. Each pane is selected and assigned a specific monitoring command.
4. Finally, the script attaches to the tmux session, displaying all the monitoring panes.

## Customization

You can modify the script to:
- Change the layout of the panes
- Add or remove monitoring commands
- Adjust the update frequency of certain commands (e.g., by using `watch`)

## Exiting the monitor

To exit the monitoring dashboard:
1. Press `Ctrl+B`, then `D` to detach from the tmux session
2. To kill the tmux session entirely, run:
   
   tmux kill-session -t system_monitors
   

## Note

Ensure you have the necessary permissions to run system monitoring commands. Some commands may require root privileges.


