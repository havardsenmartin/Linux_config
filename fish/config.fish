# ~/.config/fish/config.fish
# ============================================================
# Fish shell configuration
# Purpose:
#   - Clean defaults
#   - Easy to read
#   - Easy to modify
#   - Self-documenting
# ============================================================

# ============================================================
# SHELL BEHAVIOR
# ============================================================

# Disable Fish welcome message
set -g fish_greeting

# Enable vi-style keybindings
# Alternatives:
#   fish_default_key_bindings
fish_vi_key_bindings
# fish_default_key_bindings

# Cursor behavior for vi mode
set -g fish_cursor_default block
set -g fish_cursor_insert line
set -g fish_cursor_replace_one underscore
set -g fish_cursor_visual block

# ============================================================
# PATHS
# ============================================================

# Add custom user binaries
fish_add_path ~/.local/bin
fish_add_path ~/bin

# Optional language/tool paths
# fish_add_path ~/.cargo/bin
# fish_add_path ~/.npm-global/bin
# fish_add_path ~/.go/bin
# fish_add_path /opt/homebrew/bin

# ============================================================
# ENVIRONMENT VARIABLES
# ============================================================

# Editor
set -gx EDITOR nvim
set -gx VISUAL nvim

# Pager
set -gx PAGER less

# Browser
# set -gx BROWSER firefox

# Locale
# set -gx LANG en_US.UTF-8

# Terminal
set -gx TERM xterm-256color

# Prevent duplicate history entries
set -gx fish_history fish

# ============================================================
# HISTORY SETTINGS
# ============================================================

# Fish handles history well automatically,
# but you can tweak behavior here.

# Maximum history size (optional)
# set -U fish_history_max 100000

# Shared history across sessions is default.

# ============================================================
# ALIASES
# ============================================================

# Navigation
alias ..="cd .."
alias ...="cd ../.."

# File listing
alias ls="ls --color=auto"
alias ll="ls -lah --color=auto"
alias la="ls -A"

# Safety
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# Git
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git pull"

# System
alias grep="grep --color=auto"
alias df="df -h"
alias free="free -h"

# `open` opens file with default application
function open
    setsid xdg-open $argv >/dev/null 2>&1 &
end

# ============================================================
# MODERN TOOL REPLACEMENTS
# Uncomment if installed
# ============================================================

# eza (better ls)
# alias ls="eza --icons"
# alias ll="eza -lah --icons"

# bat (better cat)
# alias cat="bat"

# rg (ripgrep)
# alias grep="rg"

# btop instead of top
# alias top="btop"

# ============================================================
# PROMPT
# ============================================================

# Starship prompt
# Uncomment if installed
# starship init fish | source

# Tide prompt
# Uncomment if installed
# tide configure

# ============================================================
# FZF
# ============================================================

# Enable fzf keybindings if installed
# fzf_configure_bindings

# ============================================================
# CUSTOM FUNCTIONS
# ============================================================

# Example:
#
# function mkcd
#     mkdir -p $argv[1]
#     cd $argv[1]
# end

# ============================================================
# STARTUP COMMANDS
# ============================================================

# Commands here run every shell startup

# Example:
# neofetch
# fastfetch

# Auto-start tmux if not already running
# if status is-interactive
#     and not set -q TMUX
#     tmux
# end

# ============================================================
# INTERACTIVE SHELL ONLY
# ============================================================

if status is-interactive

    # Interactive-only commands here

    # Example greeting
    # echo "Welcome back."

end

# ============================================================
# DEBUG / INSPECTION
# ============================================================

# Show all exported variables:
# env

# Show fish variables:
# set

# Show PATH entries:
# printf '%s\n' $PATH

# Show aliases:
# alias

# Show functions:
# functions

# Reload config:
# source ~/.config/fish/config.fish

# ============================================================
# NOTES
# ============================================================

# Fish syntax differs from Bash:
#
# Bash:
#   export VAR=value
#
# Fish:
#   set -gx VAR value
#
# Variable scopes:
#   -g = global
#   -x = exported
#   -U = universal (persistent)
#   -l = local
#
# Example:
#   set -gx MYVAR hello
#
# ============================================================
