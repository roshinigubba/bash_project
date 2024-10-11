# Server Info Gathering Playbook

This Ansible playbook is designed to ping and gather information from remote servers. It collects hostname, current date, ping status, and password file contents from each server specified in the inventory.

## Prerequisites

- Ansible installed on the control node
- SSH access to the target servers
- Proper inventory file configuration

## Inventory File

Ensure your inventory file (`inventory.ini`) is properly configured. Example:


[servers]
server1 ansible_host=54.152.152.58 ansible_user=ec2-user ansible_ssh_private_key_file=/home/ec2-user/ec2_key.pem
server2 ansible_host=100.24.48.131 ansible_user=ec2-user ansible_ssh_private_key_file=/home/ec2-user/ec2_key_2.pem


## Playbook Structure

The playbook performs the following tasks:

1. Creates an output directory on the local machine
2. Retrieves the hostname of each server
3. Gets the current date on each server
4. Pings each server
5. Retrieves the contents of the `/etc/passwd` file
6. Displays debug information for each task
7. Prepares a formatted output with all gathered information
8. Saves the output to individual files for each server

## Usage

To run the playbook, use the following command:


ansible-playbook -i inventory.ini playbook.yml


## Output

The playbook will create a directory named `server_info1` in the current working directory. For each server in the inventory, it will create a text file named after the server's IP address (e.g., `54.152.152.58.txt`), containing the gathered information.

## Security Note

This playbook retrieves sensitive information (e.g., `/etc/passwd` contents). Ensure that:
1. You have the necessary permissions to access this information.
2. The output files are stored securely and access is restricted appropriately.

## Customization

You can modify the playbook to gather additional information or change the output format as needed. Adjust the tasks and the `output_content` variable to suit your requirements.

## Troubleshooting

If you encounter issues:
1. Verify SSH connectivity to the target servers
2. Ensure the user specified in the inventory has sufficient permissions
3. Check that the specified SSH key files exist and have correct permissions

For more detailed debugging, you can run the playbook with increased verbosity:


ansible-playbook -i inventory.ini playbook.yml -vvv

