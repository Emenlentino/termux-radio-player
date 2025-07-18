Beat Box Radio Player
A futuristic radio stream player for Termux with URL history, rich UI, and production-ready features.

Author: Emenlentino
Version: 2.1.0-beta
License: MIT
Last Updated: July 18, 2025

Description
Beat Box Radio is a modern Bash script designed to play FM radio streams in Termux. It features a vibrant UI powered by the rich Python library, URL history management, robust error handling with retry logic, and logging for debugging. This beta version (2.1.0-beta) is optimized for production testing.
Features

Play radio streams using mpv.
Save and recall up to 10 recent URLs.
Futuristic UI with colored panels and emojis.
Automatic dependency installation (mpv, dialog, figlet, python, rich).
Network retry logic with up to 5 attempts.
Detailed logging for troubleshooting.
Clean exit on Ctrl+C.

Prerequisites

Termux app installed on Android.
Internet connection for streaming and dependency installation.

Installation

Install Termux from the Google Play Store or F-Droid.
Update Termux packages:pkg update && pkg upgrade -y


Clone this repository or download beatbox.sh:git clone https://github.com/yourusername/beatbox-radio.git
cd beatbox-radio


Make the script executable:chmod +x beatbox.sh


Run the script:./beatbox.sh



The script will automatically install required dependencies (mpv, dialog, figlet, python, rich) if they are missing.
Usage

Launch the script with ./beatbox.sh.
Choose a URL from the history menu or enter a new stream URL (e.g., http://streamurl.example.com).
Press Ctrl+C to exit cleanly.
Check logs at ~/.beatbox/beatbox.log for debugging.

Configuration

URL history is stored in ~/.beatbox/history.
Logs are saved in ~/.beatbox/beatbox.log.

Beta Testing
This is a beta release (2.1.0-beta). Please test with various URLs and report issues:

Test with valid and invalid URLs.
Monitor network stability.
Share logs from ~/.beatbox/beatbox.log if errors occur.

Known Issues

Dependency installation may fail on slow networks.
UI may not render perfectly on very small screens.

Contributing

Fork the repository.
Create a feature branch (git checkout -b feature-name).
Commit changes (git commit -m "Add feature-name").
Push to the branch (git push origin feature-name).
Open a Pull Request.

License
This project is licensed under the MIT License - see the LICENSE file for details.
Acknowledgments

Thanks to the Termux community for the awesome environment.
Special thanks to the rich library developers for the stunning UI.
