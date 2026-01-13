#!/bin/bash

# Usage: ./timer.sh <minutes> [task description]
# Example: ./timer.sh 45 "Building auth feature"

STATE_FILE="$HOME/.claude/focus_state.json"
ACK_FILE="$HOME/.claude/focus_ack"

if [ -z "$1" ]; then
    echo "Usage: ./timer.sh <minutes> [task description]"
    exit 1
fi

MINUTES=$1
TASK="${2:-Focus session}"
SECONDS_TOTAL=$((MINUTES * 60))
WARNING_AT=300  # 5 minutes in seconds
START_TIME=$(date +%s)
END_TIME=$((START_TIME + SECONDS_TOTAL))

# Ensure .claude directory exists
mkdir -p "$HOME/.claude"

# Clean up any previous ack file
rm -f "$ACK_FILE"

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

    case "$OS" in
        macos)
            osascript -e "display notification \"$message\" with title \"$title\" sound name \"Glass\"" 2>/dev/null
            ;;
        linux)
            notify-send -u critical "$title" "$message" 2>/dev/null
            paplay /usr/share/sounds/freedesktop/stereo/complete.oga 2>/dev/null || \
            aplay /usr/share/sounds/alsa/Front_Center.wav 2>/dev/null || \
            echo -e '\a'
            ;;
        windows)
            powershell.exe -Command "[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms'); [System.Windows.Forms.MessageBox]::Show('$message','$title')" 2>/dev/null || \
            echo -e '\a'
            ;;
        *)
            echo -e '\a'
            ;;
    esac
}

update_state() {
    local remaining=$1
    local status=$2
    cat > "$STATE_FILE" << EOF
{
    "active": true,
    "task": "$TASK",
    "remaining_seconds": $remaining,
    "started_at": $START_TIME,
    "ends_at": $END_TIME,
    "status": "$status",
    "updated_at": $(date +%s)
}
EOF
}

update_terminal_title() {
    local mins=$1
    local secs=$2
    local status=$3
    printf "\033]0;[%02d:%02d] %s - %s\007" "$mins" "$secs" "$status" "$TASK"
}

clear_state() {
    rm -f "$STATE_FILE"
    # Reset terminal title
    printf "\033]0;%s\007" "$(basename "$PWD")"
}

# Trap to clean up on exit
trap clear_state EXIT

echo "Timer started: $MINUTES minutes"
echo "Task: $TASK"
echo "Warning at 5 minutes remaining"
echo ""
echo "State file: $STATE_FILE"
echo "To stop pinging after timer: touch $ACK_FILE"
echo ""

warned=false

# Main countdown loop
while [ $SECONDS_TOTAL -gt 0 ]; do
    mins=$((SECONDS_TOTAL / 60))
    secs=$((SECONDS_TOTAL % 60))

    printf "\r%02d:%02d remaining " $mins $secs
    update_state $SECONDS_TOTAL "running"
    update_terminal_title $mins $secs "FOCUS"

    # 5 minute warning
    if [ $SECONDS_TOTAL -eq $WARNING_AT ] && [ "$warned" = false ]; then
        notify_with_sound "5 Minutes Left" "$TASK - Timer ending soon"
        warned=true
    fi

    sleep 1
    SECONDS_TOTAL=$((SECONDS_TOTAL - 1))
done

printf "\r00:00 - Time's up!    \n"
update_state 0 "waiting_for_ack"
update_terminal_title 0 0 "DONE - REPORT BACK"
notify_with_sound "Time's Up" "$TASK - Come back and report!"

echo ""
echo "--- Waiting for you to come back ---"
echo "Pinging every 2 minutes until you acknowledge."
echo "Run: touch $ACK_FILE (or report back in Claude)"
echo ""

# Persistent ping loop until acknowledged
ping_count=0
while [ ! -f "$ACK_FILE" ]; do
    sleep 120  # 2 minutes
    ping_count=$((ping_count + 1))

    # Check again before notifying (file might have been created during sleep)
    if [ ! -f "$ACK_FILE" ]; then
        mins_waiting=$((ping_count * 2))
        notify_with_sound "Still Waiting ($mins_waiting min)" "$TASK - Come back and report!"
        update_terminal_title 0 0 "WAITING ${mins_waiting}m"
        echo "Ping #$ping_count - Still waiting for acknowledgment..."
    fi
done

echo ""
echo "Acknowledged! Cleaning up."
rm -f "$ACK_FILE"
clear_state
