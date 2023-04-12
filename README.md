# MacOS

1. Check for and/or install git `git --version`
2. Clone these dotfiles `cd ~ && git clone https://github.com/codyheaps/dotfiles.git`
3. Install Homebrew `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
4. Install Oh My Zsh `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
5. Install zsh-autosuggestions `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
6. Install powerlevel10k `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`
7. Move to mac-setup `cd ~/dotfiles/mac-setup`
8. Install Homebrew Casks `xargs brew install < brew_casks.txt`
9. Install Homebrew Formulae `xargs brew install < brew_formulae.txt`
10. Make `makesymlinks.sh` executable `chmod +x ./makesymlinks.sh`
11. Execute `./makesymlinks.sh`
12. TODO: MacOS defaults script 
13. TODO: Automate all of this
