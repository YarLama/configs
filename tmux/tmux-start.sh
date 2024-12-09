#!/bin/sh

TOOLS="tools"
CONFIGS="configs"
TEST="test"

tmux has-session -t $TOOLS 2>/dev/null

if [ $? != 0 ]; then

	tmux new-session -d -s $TOOLS -n zsh

	tmux new-window -t $TOOLS -n mc
	tmux send-keys -t $TOOLS:mc "sudo mc" Enter

	tmux new-window -t $TOOLS -n htop
	tmux send-keys -t $TOOLS:htop "htop" Enter

	tmux select-window -t $TOOLS:mc
fi

tmux has-session -t $CONFIGS 2>/dev/null

if [ $? != 0 ]; then

	tmux new-session -d -s $CONFIGS -n "nvim"
	tmux send-keys -t $CONFIGS:1 "cd ~/.config/nvim/ && nvim ." Enter

    tmux new-window -t $CONFIGS -n "tmux"
	tmux send-keys -t $CONFIGS:2 "cd ~/.config/tmux/ && nvim ." Enter

	tmux select-window -t $CONFIGS:nvim
fi

tmux has-session -t $TEST 2>/dev/null

if [ $? != 0 ]; then

	tmux new-session -d -s $TEST -n "nvim"
	tmux send-keys -t $TEST:1 "cd ~/projects/test/react-test/eslint-pretier/ && nvim ." Enter

    tmux new-window -t $TEST -n "zsh"
	tmux send-keys -t $TEST:2 "cd ~/projects/test/react-test/eslint-pretier/" Enter

	tmux select-window -t $TEST:nvim
fi

tmux attach-session -t $CONFIGS
