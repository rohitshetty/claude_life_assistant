#!/bin/bash

# Usage: ./timer.sh <minutes>
# Example: ./timer.sh 45

if [ -z "$1" ]; then
    echo "Usage: ./timer.sh <minutes>"
    exit 1
fi

MINUTES=$1
SECONDS_TOTAL=$((MINUTES * 60))
WARNING_AT=300  # 5 minutes in seconds

# Detect OS
detect_os() {
    case "$(uname -s)" in
        Darwin*) echo "macos" ;;
        Linux*)  echo "linux" ;;
        MINGW*|MSYS*|CYGWIN*) echo "windows" ;;
        *) echo "unknown" ;;
    esac
}

OS=$(detect_os)

notify_with_sound() {
    local title="$1"
    local message="$2"

    # Send notification based on OS
    case "$OS" in
        macos)
            osascript -e "display notification \"$message\" with title \"$title\" sound name \"Glass\"" 2>/dev/null
            ;;
        linux)
            notify-send -u critical "$title" "$message" 2>/dev/null
            # Play sound
            paplay /usr/share/sounds/freedesktop/stereo/complete.oga 2>/dev/null || \
            aplay /usr/share/sounds/alsa/Front_Center.wav 2>/dev/null || \
            echo -e '\a'
            ;;
        windows)
            powershell.exe -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('$message','$title')" 2>/dev/null || \
            echo -e '\a'
            ;;
        *)
            echo -e '\a'  # Terminal bell fallback
            ;;
    esac
}

echo "Timer started: $MINUTES minutes"
echo "Warning at 5 minutes remaining"
echo ""

warned=false

while [ $SECONDS_TOTAL -gt 0 ]; do
    mins=$((SECONDS_TOTAL / 60))
    secs=$((SECONDS_TOTAL % 60))
    printf "\r%02d:%02d remaining " $mins $secs

    # 5 minute warning
    if [ $SECONDS_TOTAL -eq $WARNING_AT ] && [ "$warned" = false ]; then
        notify_with_sound "5 Minutes Left" "Timer ending soon"
        warned=true
    fi

    sleep 1
    SECONDS_TOTAL=$((SECONDS_TOTAL - 1))
done

printf "\r00:00 - Time's up!    \n"
notify_with_sound "Time's Up" "Timer finished"
