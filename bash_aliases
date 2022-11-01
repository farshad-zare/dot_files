#start tmux with vim
alias vmux='tmux new-session vim \; split-window -v \; resize-pane -D 12 \; select-pane -t 0'

#start tmux with nvim
alias nmux='tmux new-session nvim \; split-window -v \; resize-pane -D 12 \;'

#youtube-dl
alias ydl='youtube-dl'

#install app 
alias add='sudo pacman -S'

#update apps
alias update='sudo pacman -Syu'

#remove app
alias remove='sudo pacman -Rns'