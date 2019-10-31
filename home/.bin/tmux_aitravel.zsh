#!/bin/zsh

TARGET_DIR=~/projects/travel.ai

function exec() {
  tmux send-keys $1 C-m
}

function change_dir() {
  exec "cd $1"
}

change_dir $TARGET_DIR
tmux split-window -h
change_dir $TARGET_DIR/js
exec "yarn watch"
tmux split-window -v
change_dir $TARGET_DIR
tmux select-pane -t 0
