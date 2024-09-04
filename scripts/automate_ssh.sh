#!/bin/bash

# Define your server details
SERVER_USER="your_username"
SERVER_HOST="your_ipaddress"
SSH_PORT="22"


# SSH into the server, switch to root, run commands, and save and display the output
 ssh -p "$SSH_PORT" "$SERVER_USER@$SERVER_HOST"<<EOF
        # Switch to root and run the commands
        sudo -i bash << ROOT_SHELL
        # Display /etc/passwd
        cat /etc/passwd
        # Display the current date
        date
ROOT_SHELL
EOF

