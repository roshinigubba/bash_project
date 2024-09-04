#!/bin/bash

# Start a new tmux session
tmux new-session -d -s system_monitors

# Split the screen into 7 panes
tmux split-window -h   # Split the screen into 2 vertical panes
tmux split-window -v   # Split the top pane into 2 horizontal panes
tmux select-pane -t 0  # Select the first pane (top-left)
tmux split-window -v   # Split the top-left pane into 2 horizontal panes

# Arrange panes
tmux select-pane -t 1
tmux split-window -h   # Split the second vertical pane into 2 vertical panes

# Arrange panes
tmux select-pane -t 2
tmux split-window -v

# Arrange panes
tmux select-pane -t 3
tmux split-window -h


# Set up the layout
tmux select-layout tiled

# Run commands in each pane
tmux select-pane -t 0
tmux send-keys "mpstat" C-m  # CPU health check

tmux select-pane -t 1
tmux send-keys "df -h" C-m  # Disk usage

tmux select-pane -t 2
tmux send-keys "free -h" C-m  # Memory usage

tmux select-pane -t 3
tmux send-keys "ps aux" C-m  # Running processes

tmux select-pane -t 4
tmux send-keys "uptime" C-m  # Uptime

tmux select-pane -t 5
tmux send-keys ""journalctl -p 3 -xb"" C-m  # Critical errors in system logs

tmux select-pane -t 6
tmux send-keys "ip a" C-m  # Network interface status

# Attach to the tmux session
tmux attach-session -t system_monitors

