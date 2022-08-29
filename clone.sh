#!/bin/sh

echo "Cloning repositories..."

PERSO=$HOME/PERSO
WORK=$HOME/WORK

# Oh My Zsh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
git clone https://github.com/lukechilds/zsh-nvm $HOME/.oh-my-zsh/custom/plugins/zsh-nvm

# Personal
# git clone git@github.com:GITHUBUSERNAME/repo-name.git $PERSO/repo-name
# etc, etc

# Work
# git clone git@github.com:my-company/repo-name.git $WORK/client-name/repo-name
# etc, etc
