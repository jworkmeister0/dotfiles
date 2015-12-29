# set-option -g default-command "reattach-to-user-namespace -l zsh"
# use C-a instead og C-b
set -g prefix C-a
unbind C-b
bind C-a send-prefix

set -s escape-time 0

set -g default-terminal "screen-256color"

# default window title colors
# set-window-option -g window-status-fg white
# set-window-option -g window-status-bg default
# #set-window-option -g window-status-attr dim
# 
# # message text
# set-option -g message-bg default
# set-option -g message-fg white

# clock
# force a reload of the config file
unbind r
bind r source-file ~/.tmux.conf

# border colours
set -g pane-border-fg magenta
set -g pane-active-border-fg green
set -g pane-active-border-bg default

# # quick pane cycling
unbind ^A
bind ^A select-pane -t :.+

set-window-option -g mode-keys vi
# # Mouse support - set to on if you want to use the mouse
# setw -g mode-mouse on
# set -g mouse-select-pane on
set -g mouse-resize-pane on
# set -g mouse-select-window on

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

set -g history-limit 20000

set -g status-bg '#222222'
set -g status-fg '#aaaaaa'


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
set -g status-interval 5               # set update frequencey (default 15 seconds)
set -g status-justify centre           # center window list for clarity
set-option -g status-position bottom    # position the status bar at top of screen

# visual notification of activity in other windows
setw -g monitor-activity on
set -g visual-activity on

# set color for status bar
set-option -g status-bg colour235 #base02
set-option -g status-fg yellow #yellow
set-option -g status-attr dim 
# 
# # set window list colors - red for active and cyan for inactive
set-window-option -g window-status-fg brightblue #base0
set-window-option -g window-status-bg colour236 
set-window-option -g window-status-attr dim

set-window-option -g window-status-current-fg brightred #orange
set-window-option -g window-status-current-bg colour235
set-window-option -g window-status-current-attr bright
# 
# set -g status-left-length 70
# 
# show session name, window & pane number, date and time on right side of
# status bar
set -g status-right-length 60
set -g status-right "%d %b %Y #[fg=green]  %l:%M %p  #(date -u  ')"

# run-shell ~/.config/tmux-yank
