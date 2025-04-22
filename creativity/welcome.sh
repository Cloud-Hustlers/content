#!/bin/bash

# Ensure figlet is installed !!!
if ! command -v figlet &> /dev/null; then
    echo "figlet not found. Installing figlet..."
    sudo apt update && sudo apt install figlet -y || { echo "Failed to install figlet. Exiting."; exit 1; }
fi

# Ensure lolcat is installed
if ! command -v lolcat &> /dev/null; then
    if command -v gem &> /dev/null; then
        echo "Installing lolcat using gem..."
        sudo gem install lolcat || { echo "Failed to install lolcat. Exiting."; exit 1; }
    else
        echo "RubyGems (gem) is not installed. Installing Ruby..."
        sudo apt update && sudo apt install ruby-full -y || { echo "Failed to install Ruby. Exiting."; exit 1; }
        sudo gem install lolcat || { echo "Failed to install lolcat. Exiting."; exit 1; }
    fi
fi

# Get terminal width
TERMINAL_WIDTH=$(tput cols)

# Center and display "Welcome to Cloud Hustlers" with extra spacing between words and bold colors
figlet -f slant -w "$TERMINAL_WIDTH" "Welcome   to   Cloud   Hustlers" | lolcat --force --seed=1 --freq=0.3
