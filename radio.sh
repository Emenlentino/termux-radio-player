#!/data/data/com.termux/files/usr/bin/bash

# Radio Player for Termux
# Author: Emenlentino
# Description: A modern, user-friendly script to play FM radio streams in Termux using streamurl.link
# Version: 1.0.0
# License: MIT

# Predefined FM stations from https://streamurl.link/

# Function to check and install dependencies
check_dependencies() {
    local deps=("mpv" "dialog" "figlet")
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            echo "Installing $dep..."
            pkg install "$dep" -y
        fi
    done
}

# Function to display a header
display_header() {
    clear
    tput setaf 2 # Brown text
    figlet -f small "FM Bix Player"
    tput sgr0 # Reset color
    echo "Modern Radio Streamer for Termux"
    echo ""
    echo "Author: Emenlentino"
    echo "--------------------------------"
}

# Function to validate URL
validate_url() {
    local url=$1
    if [[ -z "$url" || ! "$url" =~ ^https?:// ]]; then
        dialog --msgbox "Error: Please enter a valid URL starting with http:// or https://" 8 40
        return 1
    fi
    return 0
}

# Main function
main() {
    # Check and install dependencies
    check_dependencies

    # Set up colors
    tput setaf 3 # Yellow text for prompts
    while true; do
        display_header

        # Use dialog for input
        stream_url=$(dialog --inputbox "Enter the radio stream URL (or type 'exit' to quit):" 8 50 --stdout)
        dialog_exit_code=$?

        # Check if user canceled or exited
        if [[ $dialog_exit_code -ne 0 || "$stream_url" == "exit" ]]; then
            display_header
            echo "Exiting Radio Player..."
            tput sgr0
            sleep 1
            clear
            exit 0
        fi

        # Validate URL
        if validate_url "$stream_url"; then
            display_header
            tput setaf 6 # Cyan text
            echo "🎶 Now playing: $stream_url"
            tput sgr0
            mpv "$stream_url" --no-video --quiet 2>/dev/null
            dialog --msgbox "Playback stopped. Returning to menu..." 6 30
        fi
    done
}

# Trap Ctrl+C to exit cleanly
trap 'clear; tput sgr0; echo "Exiting Radio Player..."; exit 0' INT

# Run main function
main