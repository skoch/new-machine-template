# New Machine Setup

## Concept
You have a new machine and wish to get setup as fast as possible with very little friction. Here we will use 2 repos: one to maintain the setup scripts and one to maintain your dotfiles.

By following the steps outlined below you should be able to install some necessary tools by running scripts, grab your dotfiles and then finish installing apps/dependencies using [Homebrew](https://brew.sh/).

Moving forward, you should update the Brewfile to match your current setup. Intead of downloading a package, can you install via `brew` command?

## Files
```
aliases.zsh - referenced by .zshrc, contains all your aliases
Brewfile - list of deps and apps you want to install
clone.sh - list of repos you want to clone during setup
path.zsh - referenced by .zshrc, contains any exported $PATHs
setup.sh - main point of entry after tools are installed
ssh.sh - script to create SSH key for GitHub
tools.sh - script to install Oh My Zsh and Homebrew
```

## Assumptions
This assumes you have a repository that maintains your dotfiles using [chezmoi](https://www.chezmoi.io/) as well as using [Oh My Zsh](https://ohmyz.sh/) and that you are maintaining your `.zshrc` file.
If you do not use chezmoi, you can adapt to your needs.

### Add to `.zshrc` file
As noted above, we reference `path.zsh` and `aliases.zsh` from `.zshrc`. First create a variable near the top of the file to the path to your setup files and then source them in the User configuration section:
```
# Path to my setup files.
export SETUPFILES=$HOME/.my-setup

# User configuration

# since we aren't using a different custom folder, we need to source aliases and path
source $SETUPFILES/aliases.zsh
source $SETUPFILES/path.zsh

```

## Steps
1. On current machine, create a new SSH Key Passphrase in 1Password (for use after step 6)
2. On new machine, log into GitHub
3. Open Terminal
4. Issue git clone command to prompt for install of git and proceed with installation
   ```bash
   git clone git@github.com:GITHUBUSERNAME/new-machine.git ~/.my-setup
   ```
   1. NB: You can choose wherever you'd like to clone the repo however note the location for when referencing `path.zsh` and `aliases.zsh` from `.zshrc` (see `aliases.zsh`)
5. `cd` into the repo
6. Generate a new SSH key for GitHub
   ```bash
   ./ssh.sh
   ```
7. Copy contents of pub file when done and add to GitHub
8. Install Oh My Zsh and Homebrew
   ```bash
   ./tools.sh
   ```
9. Install `chezmoi`
    ```bash
    brew install chezmoi
    ```
10. Initialize `chezmoi` and install
    ```bash
    # one liner
    chezmoi init --apply git@github.com:GITHUBUSERNAME/dotfiles.git
    # alternately, initialize and then apply which allows an optional step to check first
    chezmoi init git@github.com:GITHUBUSERNAME/dotfiles.git
    # chezmoi diff
    chezmoi apply -v
    ```
11. Now that you have your `dotfiles` in place, you can install your apps and dependencies via the setup script however not a bad idea to check `Brewfile` and `clone.sh` first.
    ```bash
    $ ./setup.sh
    ```
## Applications
Here I have notes for specific applications that need further setup: 1Password, iTerm, Dropbox, any fonts I use to install, etc
