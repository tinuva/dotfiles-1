#!/usr/bin/env bash

################################################################################
# install
#
# This script symlinks the dotfiles into place in the home directory.
################################################################################

dotfiles_echo() {
  local fmt="$1"; shift

  # shellcheck disable=SC2059
  printf "\\n[DOTFILES] $fmt\\n" "$@"
}

set -e # Terminate script if anything exits with a non-zero value

DOTFILES_DIR=$HOME/dotfiles
VIM_DIR=$HOME/.vim
NVIM_DIR=$HOME/.config/nvim
OH_MY_ZSH_DIR=$HOME/.oh-my-zsh

files=(
"asdfrc"
"default-gems"
"default-npm-packages"
"gemrc"
"gitconfig"
"gitignore_global"
"gitmessage"
"hushlogin"
"npmrc"
"pryrc"
"rubocop.yml"
"tmux.conf"
"tool-versions"
"vimrc"
"zshrc"
)

dotfiles_echo "Installing dotfiles..."

for file in "${files[@]}"; do
  if [ -f "$HOME"/."$file" ]; then
    dotfiles_echo ".$file already present. Backing up..."
    cp "$HOME"/."$file" "$HOME"/."${file}"_backup
    rm -f "$HOME"/."$file"
  fi
  dotfiles_echo "-> Linking $DOTFILES_DIR/$file to $HOME/.$file..."
  ln -nfs "$DOTFILES_DIR"/"$file" "$HOME"/."$file"
done

dotfiles_echo "-> Linking $DOTFILES_DIR/Brewfile to $HOME/Brewfile..."
ln -nfs "$DOTFILES_DIR"/Brewfile "$HOME"/Brewfile

dotfiles_echo "Setting up Vim and Neovim..."

if [ ! -d "$VIM_DIR" ]; then
  mkdir -p "$VIM_DIR"
fi

if [ ! -d "$NVIM_DIR" ]; then
  mkdir -p "$NVIM_DIR"
fi

if [ ! -d "OH_MY_ZSH_DIR" ]; then
  dotfiles_echo "-> Installing spaceship prompt for oh-my-zsh..."
  git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
  dotfiles_echo "-> Linking spaceship.zsh-theme..."
  ln -nfs "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"
fi

dotfiles_echo "-> Linking $DOTFILES_DIR/vim/ftplugin to $VIM_DIR/ftplugin..."
ln -nfs "$DOTFILES_DIR"/vim/ftplugin "$VIM_DIR"/ftplugin

dotfiles_echo "-> Linking $DOTFILES_DIR/vim/colors to $VIM_DIR/colors..."
ln -nfs "$DOTFILES_DIR"/vim/colors "$VIM_DIR"/colors

dotfiles_echo "-> Linking $DOTFILES_DIR/vim/spell to $VIM_DIR/spell..."
ln -nfs "$DOTFILES_DIR"/vim/spell "$VIM_DIR"/spell

dotfiles_echo "-> Linking $DOTFILES_DIR/vim/UltiSnips to $VIM_DIR/UltiSnips..."
ln -nfs "$DOTFILES_DIR"/vim/UltiSnips "$VIM_DIR"/UltiSnips

dotfiles_echo "-> Linking $DOTFILES_DIR/init.vim to $NVIM_DIR/init.vim..."
ln -nfs "$DOTFILES_DIR"/init.vim "$NVIM_DIR"/init.vim

dotfiles_echo "Dotfiles installation complete!"

dotfiles_echo "Post-install recommendations:"
dotfiles_echo "- Complete Brew Bundle installation with 'brew bundle install'"
dotfiles_echo "- The first time you launch Vim or Neovim, plugins will be installed automatically."
dotfiles_echo "- After launching Neovim, run :checkhealth and resolve any errors/warnings."
