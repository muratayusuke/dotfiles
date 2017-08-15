#!/bin/zsh

TARGET_DIR=~/projects/travel.ai

function change_dir() {
  tmux send-keys "cd $TARGET_DIR" C-m
}

change_dir
tmux split-window -h
change_dir
tmux split-window -v
change_dir
tmux select-pane -t 0
tmux split-window -v
change_dir
