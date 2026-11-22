export GPG_TTY=$(tty)

# Fish - https://fishshell.com/

set -g fish_greeting

source ~/.config/fish/secrets/openrouter.fish

# Starship - https://starship.rs

starship init fish | source

# direnv - https://direnv.net

direnv hook fish | source

# Zoxide - https://github.com/ajeetdsouza/zoxide

zoxide init fish | source

# fzf - https://github.com/junegunn/fzf

fzf --fish | source

# Aliases

alias hype="uwsm start hyprland-uwsm.desktop"

# Functions

function up
    set -l levels $argv[1]

    if test -z "$levels"
        set levels 1
    end

    cd (string repeat -n $levels ../)
end
