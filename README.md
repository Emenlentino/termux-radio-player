# Termux FM Radio Player

A modern, user-friendly script to play FM radio streams in Termux using predefined stations from [streamurl.link](https://streamurl.link/) or custom URLs.

**Author**: Emenlentino  
**Version**: 1.0.0  
**License**: MIT

## Features
- Interactive menu with predefined FM stations.
- Option to enter custom radio stream URLs.
- Modern UI with ASCII art and colored text.
- Automatic dependency installation (`mpv`, `dialog`, `figlet`).
- Error handling and logging to `radio.log`.
- Optimized for Termux on Android.

## Requirements
- Termux installed on an Android device.
- Internet connection for streaming and package installation.

## Installation
1. Clone or download the repository:
   ```bash
   git clone https://github.com/emenlentino/termux-radio-player.git
   cd termux-radio-player
   ```
2. Make the script executable:
   ```bash
   chmod +x radio.sh
   ```
3. Run the script:
   ```bash
   ./radio.sh
   ```

## Usage
- Select a predefined FM station from the menu (e.g., BBC Radio 1, Capital FM).
- Choose "Enter Custom URL" to input a custom stream URL.
- Press `Ctrl+C` to stop playback and return to the menu.
- Cancel the menu or select "Enter Custom URL" and cancel to exit.

## Predefined Stations
The script includes the following FM stations from [streamurl.link](https://streamurl.link/):
- BBC Radio 1
- Capital FM
- Heart FM
- Kiss FM
- Classic FM

## Logging
Errors and playback events are logged to `radio.log` in the script's directory for debugging.

## Contributing
1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Make changes and commit (`git commit -m "Add feature"`).
4. Push to the branch (`git push origin feature-branch`).
5. Create a pull request.

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements
- Built for Termux users.
- Radio streams sourced from [streamurl.link](https://streamurl.link/).
- Author: Emenlentino