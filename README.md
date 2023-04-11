# MacOS

1. Check for and/or install git `git --version`
2. Clone these dotfiles `cd ~ && git clone https://github.com/codyheaps/dotfiles.git`
3. Install Homebrew `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
4. Install Oh My Zsh `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
5. Move to mac-setup `cd ~/dotfiles/mac-setup`
6. Install Homebrew Casks `xargs brew install < brew-casks.txt`
7. Install Homebrew Formulae `xargs brew install < brew-formulae.txt`
8. Make `makesymlinks.sh` executable `chmod -x makesymlinks.sh`
9. Execute `./makesymlinks.sh`
10. TODO: MacOS defaults script 
11. TODO: Automate all of this
