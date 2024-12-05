#!/bin/sh

SESH_NAME="main"
CONFIGS_SESH="configs"

tmux has-session -t $SESH_NAME 2>/dev/null

if [ $? != 0 ]; then

	tmux new-session -d -s $SESH_NAME -n zsh

	tmux new-window -t $SESH_NAME -n mc
	tmux send-keys -t $SESH_NAME:mc "sudo mc" Enter

	tmux new-window -t $SESH_NAME -n htop
	tmux send-keys -t $SESH_NAME:htop "htop" Enter

	tmux select-window -t $SESH_NAME:mc
fi

tmux has-session -t $CONFIGS_SESH 2>/dev/null

if [ $? != 0 ]; then

	tmux new-session -d -s $CONFIGS_SESH -n "nvim"
	tmux send-keys -t $CONFIGS_SESH:nvim "cd ~/.config/nvim/" Enter
	tmux send-keys -t $CONFIGS_SESH:nvim "nvim ." Enter

    tmux new-window -t $CONFIGS_SESH -n "tmux"
	tmux send-keys -t $CONFIGS_SESH:tmux "cd ~/.config/tmux/" Enter
	tmux send-keys -t $CONFIGS_SESH:tmux "nvim ." Enter

	tmux select-window -t $CONFIGS_SESH:nvim
fi

tmux attach-session -t $CONFIGS_SESH
