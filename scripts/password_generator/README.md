# Random Password Generator

## Overview

This Bash script generates a random, secure password using a combination of alphabets, numbers, and special characters. The generated password is 8 characters long and includes a mix of uppercase and lowercase letters, digits, and special symbols.

## Features

- Generates an 8-character password
- Includes:
  - 4 alphabetic characters (mix of uppercase and lowercase)
  - 2 numeric characters
  - 2 special characters
- Uses `/dev/urandom` for cryptographically secure random number generation
- Shuffles the final password for added randomness

## Requirements

- Bash shell
- Standard Unix utilities (tr, fold, head, shuf)

## Usage

1. Save the script to a file, e.g., `generate_password.sh`
2. Make the script executable:
   
   chmod +x generate_password.sh
   
3. Run the script:
   
   ./generate_password.sh
   

## How it works

1. The script defines three character sets: alphabets, numbers, and special characters.
2. It uses `/dev/urandom` to generate random characters from each set:
   - 4 alphabetic characters
   - 2 numeric characters
   - 2 special characters
3. These characters are combined and then shuffled to produce the final password.
4. The generated password is printed to the console.

## Customization

You can modify the script to:
- Change the length of the password by adjusting the numbers in the `fold -w` commands
- Alter the character sets used for generation
- Modify the ratio of different types of characters in the password

