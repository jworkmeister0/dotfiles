# set-option -g default-command "reattach-to-user-namespace -l zsh"
# use C-a instead og C-b
set -g prefix C-a
unbind C-b
bind C-a send-prefix

set -s escape-time 0

# SEE: nerdyweekly.com/posts/enable-italic-text-vim-tmux-gnome-terminal/
set -g default-terminal "xterm-256color-italic"

# Start numbering at 1
set -g base-index 1

set-option -g message-bg black
set-option -g message-fg colour226

# clock
# force a reload of the config file
unbind r
bind r source-file ~/.tmux.conf \; display-message "Config reloaded..."

set -g @shell_mode 'vi'
# border colours
set -g pane-border-fg colour236
set -g pane-active-border-fg colour245
set -g pane-active-border-bg default
# set-option -g pane-border-fg colour26 #base02
# set-option -g pane-active-border-fg colour7 #base01

# # quick pane cycling
unbind ^A
bind ^A select-pane -t :.+

set-window-option -g mode-keys vi
# # Mouse support - set to on if you want to use the mouse
setw -g mode-mouse off
set -g mouse-select-pane on
set -g mouse-resize-pane off
set -g mouse-select-window on

set -g set-titles on
set -g set-titles-string '#T'

# # Maximize and restore a pane
#unbind Up bind Up new-window -d -n tmp \; swap-pane -s tmp.1 \; select-window -t tmp
#unbind Down
#bind Down last-window \; swap-pane -s tmp.1 \; kill-window -t tmp

bind-key -t vi-copy 'v' begin-selection
# bind-key -t vi-copy 'y' copy-selection
bind y run-shell "tmux show-buffer | xclip -sel clip -i" \; display-message "Copied tmux buffer to system clipboard"

# resize
bind h resize-pane -L 10
bind j resize-pane -D 10
bind k resize-pane -U 10
bind l resize-pane -R 10

bind -n M-h resize-pane -L 5
bind -n M-j resize-pane -D 5
bind -n M-k resize-pane -U 5
bind -n M-l resize-pane -R 5

set -g history-limit 20000

#set -g status-bg colour0
#set -g status-fg colour3


# smart pane switching with awareness of vim splits
bind -n C-h run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-h) || tmux select-pane -L"
bind -n C-j run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-j) || tmux select-pane -D"
bind -n C-k run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-k) || tmux select-pane -U"
bind -n C-l run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-l) || tmux select-pane -R"
bind -n C-\ run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys 'C-\\') || tmux select-pane -l"
#
bind \ split-window -h # Split panes horizontal
bind - split-window -v # Split panes vertically

# ----------------------
# Status Bar
# -----------------------
# set-option -g status on                # turn the status bar on
set-option -g quiet on
set -g status-utf8 on                  # set utf-8 for the status bar
set -g status-interval 15               # set update frequency (default 15 seconds)
set -g status-justify centre           # center window list for clarity
set-option -g status-position bottom    # position the status bar at top of screen

# visual notification of activity in other windows
setw -g monitor-activity off
set-window-option -g monitor-activity off
set -g visual-activity off
set-option -g visual-bell off

# set color for status bar
set-option -g status-bg colour232 #base02
set-option -g status-fg colour8


# default window title colors
set-window-option -g window-status-fg colour8
set-window-option -g window-status-bg colour232
#set-window-option -g window-status-attr dim

# active window title colors
# set-window-option -g window-status-current-fg colour255
set-window-option -g window-status-current-attr bright
set-window-option -g window-status-current-fg colour11
set-window-option -g window-status-current-bg colour232

set -g status-left-length 100

#set -g status-left "#(/usr/bin/tmux-cpu)"
# set-option -g status-left '#(/usr/bin/tmux-cpu --format ":percent")'
#       order params: wired, active, cached, inactive, free
# set -g status-left '#(rainbarf --norgb --width 45 --noloadavg --nobattery --bright --order wacfi) #(/usr/bin/tmux-cpu --format ":percent")'
set -g status-left " %a, %b %d #(date -u  ')"
#set -g status-left "#[fg=yellow,bg=colour234]#(tmux-mem-cpu-load --interval 1 -g 5)#[default]"


set -g status-right-length 100
set -g status-right "%l:%M %p "
# set -g status-right '#[fg=green,bg=default,bright]#(tmux-mem-cpu-load) #[fg=red,dim,bg=default]#(uptime | cut -f 4-5 -d " " | cut -f 1 -d ",") #[fg=white,bg=default]%a%l:%M:%S %p#[default] #[fg=blue]%Y-%m-%d'

run-shell ~/.config/tmux-yank/yank.tmux

