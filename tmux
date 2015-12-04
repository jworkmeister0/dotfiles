#set-option -g default-command "reattach-to-user-namespace -l zsh"
# use C-a instead og C-b
set -g prefix C-a
unbind C-b
bind C-a send-prefix

set -g default-terminal "screen-256color"

new true
set set-remain-on-exit on
new -n one ls
neww -n two ls
# default statusbar colors
set-option -g status-bg colour16 #black
set-option -g status-fg white
set-option -g status-attr white

# center windows
set -g status-justify centre

# default window title colors
set-window-option -g window-status-fg white
set-window-option -g window-status-bg default
#set-window-option -g window-status-attr dim

# active window title colors
set-window-option -g window-status-current-fg white
set-window-option -g window-status-current-bg default
#set-window-option -g window-status-current-attr bright

# pane border
set-option -g pane-border-fg colour16 #base02
set-option -g pane-active-border-fg colour16 #base01

# message text
set-option -g message-bg default
set-option -g message-fg white

# pane number display
set-option -g display-panes-active-colour blue
set-option -g display-panes-colour red

# clock
set-window-option -g clock-mode-colour white
# force a reload of the config file
unbind r
bind r source-file ~/.tmux.conf
#
# # quick pane cycling
unbind ^A
bind ^A select-pane -t :.+

set-window-option -g mode-keys vi
# Mouse support - set to on if you want to use the mouse
setw -g mode-mouse on
set -g mouse-select-pane on
set -g mouse-resize-pane on
set -g mouse-select-window on

# # enable activity alerts
setw -g monitor-activity on
set -g visual-activity on
setw -g window-status-format "#{pane_current_path}".
# # Center the window list
set -g status-justify centre
#
# # Maximize and restore a pane
#unbind Up bind Up new-window -d -n tmp \; swap-pane -s tmp.1 \; select-window -t tmp
#unbind Down
#bind Down last-window \; swap-pane -s tmp.1 \; kill-window -t tmp

bind-key -t vi-copy 'v' begin-selection
bind-key -t vi-copy 'y' copy-selection

set -g history-limit 20000
set -g status-left "#{pane_current_path}"

set -g status-bg '#222222'
set -g status-fg '#aaaaaa'


# smart pane switching with awareness of vim splits
bind -n C-h run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-h) || tmux select-pane -L"
bind -n C-j run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-j) || tmux select-pane -D"
bind -n C-k run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-k) || tmux select-pane -U"
bind -n C-l run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys C-l) || tmux select-pane -R"
bind -n C-\ run "(tmux display-message -p '#{pane_current_command}' | grep -iq vim && tmux send-keys 'C-\\') || tmux select-pane -l"

bind \ split-window -h # Split panes horizontal
bind - split-window -v # Split panes vertically
