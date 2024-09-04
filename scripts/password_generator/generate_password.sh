#!/bin/bash

# Function to generate a random string
generate_password() {
    # Define character sets
    alphabets="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    numbers="0123456789"
    special_chars="!@#$%^&*()-_=+[]{};:,.<>?/|"
                   
    # Generate random characters
    random_alphabets=$(head /dev/urandom | tr -dc "$alphabets" | fold -w 4 | head -n 1)
    random_numbers=$(head /dev/urandom | tr -dc "$numbers" | fold -w 2 | head -n 1)
    random_special_chars=$(head /dev/urandom | tr -dc "$special_chars" | fold -w 2 | head -n 1)

    # Print the generated parts
    #echo "Alphabets: $random_alphabets"
    #echo "Numbers: $random_numbers"
    #echo "Special characters: $random_special_chars"

    # Combine and shuffle
    combined="${random_alphabets}${random_numbers}${random_special_chars}"
    password=$(echo "$combined" | fold -w1 | shuf | tr -d '\n')

    # Output the generated password
    echo "Password: $password"
}

# Call the function to generate and print the password
generate_password

