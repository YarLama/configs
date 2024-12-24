#!/bin/sh

TOOLS="tools"
CONFIGS="configs"
TEST="test"
PROJECT_HOOKS="hooks"

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

    tmux new-window -t $CONFIGS -n "dwm"
	tmux send-keys -t $CONFIGS:3 "cd ~/.config/dwm/ && nvim ." Enter

    tmux new-window -t $CONFIGS -n "st"
	tmux send-keys -t $CONFIGS:4 "cd ~/.config/st/ && nvim ." Enter

    tmux new-window -t $CONFIGS -n "slstatus"
	tmux send-keys -t $CONFIGS:5 "cd ~/.config/slstatus/ && nvim ." Enter

	tmux select-window -t $CONFIGS:nvim
fi

tmux has-session -t $PROJECT_HOOKS 2>/dev/null

if [ $? != 0 ]; then

	tmux new-session -d -s $PROJECT_HOOKS -n "nvim"
	tmux send-keys -t $PROJECT_HOOKS:1 "cd ~/projects/js/hooks/ && nvim ." Enter

    tmux new-window -t $PROJECT_HOOKS -n "test_place"
	tmux send-keys -t $PROJECT_HOOKS:2 "cd ~/projects/js/hooks/test_place/ && nvim ." Enter

    tmux new-window -t $PROJECT_HOOKS -n "zsh"
	tmux send-keys -t $PROJECT_HOOKS:3 "cd ~/projects/js/hooks/test_place/ && npm run dev" Enter

	tmux select-window -t $PROJECT_HOOKS:nvim
fi

tmux attach-session -t $PROJECT_HOOKS
