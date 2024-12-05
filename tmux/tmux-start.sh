#!/bin/sh

SESH_NAME="main"
NVIM_CONFIG_SESH_NAME="nvim_config"

tmux source ~/.config/tmux/.tmux.conf
tmux has-session -t $SESH_NAME 2>/dev/null

if [ $? != 0 ]; then

	tmux new-session -d -s $SESH_NAME -n zsh

	tmux new-window -n mc
	tmux send-keys "sudo mc" Enter

	tmux new-window -n htop
	tmux send-keys "htop" Enter

	tmux select-window -t $SESH_NAME:mc
fi

tmux has-session -t $NVIM_CONFIG_SESH_NAME 2>/dev/null

if [ $? != 0 ]; then

	tmux new-session -d -s $NVIM_CONFIG_SESH_NAME -n nvim

	tmux send-keys "cd ~/.config/nvim/" Enter
	tmux send-keys "nvim ." Enter

	tmux select-window -t $NVIM_CONFIG_SESH_NAME:nvim
fi

tmux attach-session -t $NVIM_CONFIG_SESH_NAME
