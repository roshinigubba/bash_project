#!/bin/bash
# Define variables
REMOTE_HOST="192.168.127.24"   # Replace with your remote server address
REMOTE_USER="roshinigubba"  # Replace with your remote server username
COMMAND1="cat /etc/passwd"  # Replace with the first command to run as root
COMMAND2="date"         # Replace with the second command to run as root

# Prompt for SSH password
echo -n "Enter SSH password for $REMOTE_USER@$REMOTE_HOST: "
read -s SSH_PASSWORD
echo

# Connect to the remote server and execute commands as root
ssh -T "$REMOTE_USER@$REMOTE_HOST" << EOF
    echo "$SSH_PASSWORD" | sudo -S bash -c "
    $COMMAND1
    $COMMAND2
    "
EOF


