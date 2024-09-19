# System Monitoring Script

## Overview

This Bash script provides a comprehensive overview of various system metrics and statuses. It's designed to give system administrators and users a quick snapshot of their system's health and performance.

## Features

The script displays information on:

1. CPU health
2. Memory usage
3. Disk usage
4. Network interface status and throughput
5. Running processes
6. System uptime
7. Critical errors in system logs

## Requirements

- Bash shell
- Standard Unix utilities:
  - mpstat
  - free
  - df
  - ifconfig (or ip)
  - ps
  - uptime
  - journalctl

## Usage

1. Save the script to a file, e.g., `system_monitor.sh`
2. Make the script executable:
   ```
   chmod +x system_monitor.sh
   ```
3. Run the script:
   ```
   ./system_monitor.sh
   ```

## Output Sections

1. **CPU Health Check**: Uses `mpstat` to display CPU statistics.
2. **Memory Usage**: Shows memory usage statistics using `free -h`.
3. **Disk Usage**: Displays disk usage information with `df -h`.
4. **Network Interface Status**: Shows network interface information using `ifconfig`.
5. **Running Processes**: Lists all running processes with `ps aux`.
6. **System Uptime**: Displays system uptime information.
7. **Critical Errors in System Logs**: Shows critical errors from system logs using `journalctl`.

## Customization

You can modify the script to:
- Use alternative commands (e.g., `ip` instead of `ifconfig`)
- Add or remove sections
- Change the output format or level of detail

Commented-out lines in the script suggest alternative or additional commands:
- `iostat` and `top` for CPU and I/O statistics
- `ip -s link` for network statistics
- `ps aux | awk '$8=="R"{print$0}'` to show only running processes

## Note

Some commands (like `journalctl`) may require root privileges to access all information. Run the script with `sudo` if you need full access to system information.

