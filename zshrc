# ~/.zshrc

export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin
export EDITOR="nano"
export BUNDLER_EDITOR=$EDITOR
export MANPAGER="less -X" # Don’t clear the screen after quitting a manual page
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export GOPATH=$HOME/go
export PATH=/usr/local/sbin:$PATH:$GOPATH/bin
export SOURCE_ANNOTATION_DIRECTORIES="spec"
export DISABLE_AUTO_TITLE=true
export _Z_OWNER=$USER
export RUBY_CONFIGURE_OPTIONS='--with-opt-dir=/usr/local/opt/openssl:/usr/local/opt/readline:/usr/local/opt/libyaml:/usr/local/opt/gdbm'
export XDG_CONFIG_HOME=$HOME/.config

#. $HOME/dotfiles/zsh/oh-my-zsh
. $HOME/dotfiles/zsh/grml
. $HOME/dotfiles/zsh/opts
. $HOME/dotfiles/zsh/aliases
. $HOME/dotfiles/zsh/tmux
. $HOME/dotfiles/zsh/functions
. $HOME/dotfiles/zsh/z.sh
. $HOME/dotfiles/zsh/up-down

cdpath=($HOME/code $HOME/dotfiles $HOME/Developer $HOME/Sites $HOME)

HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.zsh_history
HIST_STAMPS="yyyy-mm-dd"

# asdf
#. $HOME/.asdf/asdf.sh
#. $HOME/.asdf/completions/asdf.bash

# Use vi mode
bindkey -v

# Vi mode settings
# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Easier, more vim-like editor opening
bindkey -M vicmd v edit-command-line

# Make Vi mode transitions faster (KEYTIMEOUT is in hundredths of a second)
export KEYTIMEOUT=1

# Travis CI
[ -f ~/.travis/travis.sh ] && . ~/.travis/travis.sh

# Include local settings
[[ -f ~/.zshrc.local ]] && . ~/.zshrc.local

# Syntax highlighting
source ~/dotfiles/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
