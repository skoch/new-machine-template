#!/bin/sh

# Update Homebrew recipes
echo "Updating Homebrew..."
brew update

# Install all our dependencies with bundle (See Brewfile)
echo "Installing dependencies and applications..."
brew tap homebrew/bundle
brew bundle --file Brewfile

# Create WORK and PERSO directories
echo "Creating directories..."
mkdir $HOME/WORK
mkdir $HOME/PERSO

# Clone Github repositories
echo "Cloning repos..."
clone.sh

echo "Done setup"
