#!/bin/bash

# Start a new tmux session named "system_info"
tmux new-session -d -s system_information

# Split the window into three panes
tmux split-window -h
tmux split-window -h  # Split window horizontally
tmux split-window -v
tmux split-window -v  # Split window vertically from the right pane

# Run CPU info in the first pane
tmux select-pane -t 0
tmux send-keys "mpstat" C-m

# Run Memory info in the second pane
tmux select-pane -t 1
tmux send-keys "free -h" C-m

# Run Disk info in the third pane
tmux select-pane -t 2
tmux send-keys "df -h" C-m

# Run network interface info in the fourth pane
tmux select-pane -t 3
tmux send-keys "ifconfig" C-m


# Attach to the tmux session
tmux attach-session -t system_info

