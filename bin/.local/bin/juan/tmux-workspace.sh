#!/usr/bin/bash

selected=`ls ~/code/workspace | rofi -show -dmenu -i` 
mydir="/code/workspace/${selected}"
echo $HOME$mydir

st -e sh -c "
cd $HOME$mydir

tmux new-session -s 'work' -d
tmux rename-window -t work $selected

tmux send-keys -t work 'nvim .' C-m
tmux split-window -h -l 30% -t work 
tmux select-pane -t 0

tmux select-window -t work:1
tmux attach -t work
"
