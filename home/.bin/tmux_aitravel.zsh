#!/bin/zsh

TARGET_DIR=~/projects/travel.ai

function change_dir() {
  tmux send-keys "cd $1" C-m
}

change_dir $TARGET_DIR
tmux split-window -h
change_dir $TARGET_DIR/js
tmux split-window -v
change_dir $TARGET_DIR
tmux select-pane -t 0
