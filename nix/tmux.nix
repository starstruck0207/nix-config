{ config, pkgs, ...}:

{
  programs.tmux = {
    enable = true;

    # Use Ctrl-a as modifier
    shortcut = "a";

    # Windows begin from no. 1
    baseIndex = 1;

    # Vi friendly 
    keyMode = "vi";
    customPaneNavigationAndResize = true;

    aggressiveResize = true;
    historyLimit = 100000;
    newSession = true;
    resizeAmount = 5;
    escapeTime = 0;

    extraTmuxConf = ''
      # Fix environment variables
      set-option -g update-environment "SSH_AUTH_SOCK \
                                        SSH_CONNECTION \
                                        DISPLAY"

      # Mouse works as expected
      set-option -g mouse on

      # Extra Vi friendly stuff
# y and p as in vim
bind Escape copy-mode
unbind p
bind p paste-buffer
bind-key -T copy-mode-vi 'v' send -X begin-selection
bind-key -T copy-mode-vi 'C-v' send -X rectangle-toggle
#bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel
bind-key -T copy-mode-vi 'y' send -X copy-pipe-and-cancel 'xclip -in -selection clipboard'
bind-key -T copy-mode-vi 'Space' send -X halfpage-down
bind-key -T copy-mode-vi 'Bspace' send -X halfpage-up
bind-key -Tcopy-mode-vi 'Escape' send -X cancel


    '';
  };
}