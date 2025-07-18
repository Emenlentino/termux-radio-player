#!/data/data/com.termux/files/usr/bin/bash

# Beat Box Radio 2.0.0 - Hybrid Bash + Python
# Author: Emenlentino
# Description: Modern FM streaming with rich UI, retry logic, and URL history
# License: MIT

# 🎵 Check and install dependencies
check_dependencies() {
    local deps=("python" "mpv" "figlet")
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" &> /dev/null; then
            echo "Installing $dep..."
            pkg install "$dep" -y
        fi
    done

    # Python packages
    pip install --upgrade rich prompt_toolkit
}

# 🧠 Write Python script to temp file
write_python_script() {
    cat << 'EOF' > /data/data/com.termux/files/usr/bin/beatbox_radio.py
#!/data/data/com.termux/files/usr/bin/python

import os
import time
import subprocess
from rich import print
from rich.panel import Panel
from rich.console import Console
from rich.prompt import Prompt
from rich.table import Table
from prompt_toolkit import prompt

# Constants
HISTORY_FILE = os.path.expanduser("~/.beatbox_history")
MAX_HISTORY = 10
RETRY_LIMIT = 3
RETRY_DELAY = 5
console = Console()

# 🎵 Display Header
def display_header():
    console.clear()
    console.print(Panel.fit("[bold magenta]🎧 Beat Box Radio 2.0.0[/bold magenta]\n[cyan]Modern FM Streaming for Termux[/cyan]\n[green]Author: Emenlentino[/green]", title="🚀 Welcome", border_style="purple"))

# 📜 Load URL History
def load_history():
    if not os.path.exists(HISTORY_FILE):
        return []
    with open(HISTORY_FILE, "r") as f:
        return [line.strip() for line in f.readlines() if line.strip()]

# 💾 Save URL to History
def save_to_history(url):
    history = load_history()
    if url in history:
        history.remove(url)
    history.insert(0, url)
    history = history[:MAX_HISTORY]
    with open(HISTORY_FILE, "w") as f:
        f.write("\n".join(history))

# 🎶 Play Stream with Retry Logic
def play_stream(url):
    for attempt in range(1, RETRY_LIMIT + 1):
        console.print(f"[yellow]Attempt {attempt} to play stream...[/yellow]")
        try:
            result = subprocess.run(["mpv", url, "--no-video", "--quiet"], check=True)
            console.print("[green]✅ Playback finished.[/green]")
            return
        except subprocess.CalledProcessError:
            console.print(f"[red]❌ Failed to play stream. Retrying in {RETRY_DELAY} seconds...[/red]")
            time.sleep(RETRY_DELAY)
    console.print("[bold red]🚫 All retry attempts failed.[/bold red]")

# 📋 Show History Menu
def show_history_menu():
    history = load_history()
    if not history:
        return None
    table = Table(title="📜 URL History")
    table.add_column("Index", justify="right")
    table.add_column("Stream URL", justify="left")
    for i, url in enumerate(history):
        table.add_row(str(i + 1), url)
    console.print(table)
    choice = Prompt.ask("Enter index to play or press Enter to skip", default="")
    if choice.isdigit():
        idx = int(choice) - 1
        if 0 <= idx < len(history):
            return history[idx]
    return None

# 🧠 Main Loop
def main():
    display_header()
    selected_url = show_history_menu()
    while True:
        url = selected_url or prompt("🔗 Enter stream URL (or type 'exit'): ")
        if url.lower() == "exit":
            console.print("[cyan]👋 Exiting Beat Box Radio. Stay groovy![/cyan]")
            break
        if not url.startswith("http://") and not url.startswith("https://"):
            console.print("[red]Invalid URL. Must start with http:// or https://[/red]")
            continue
        save_to_history(url)
        console.print(Panel.fit(f"🎶 Now Playing:\n[bold cyan]{url}[/bold cyan]", border_style="magenta"))
        play_stream(url)
        selected_url = None  # Reset after first loop

if __name__ == "__main__":
    main()
EOF

    chmod +x /data/data/com.termux/files/usr/bin/beatbox_radio.py
}

# 🚀 Launch Python player
launch_player() {
    python /data/data/com.termux/files/usr/bin/beatbox_radio.py
}

# 🧩 Run everything
main() {
    check_dependencies
    write_python_script
    launch_player
}

main