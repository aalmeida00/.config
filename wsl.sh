#!/bin/bash

# Configure Git name and email if desired
read -p "Do you want to configure Git name and email? (y/N): " configure_git

if [[ $configure_git =~ ^[Yy]$ ]]; then
    read -p "Enter your Git name and last name: " git_name
    read -p "Enter your Git email: " git_email

    git config --global user.name "$git_name"
    git config --global user.email "$git_email"
fi

# Update package repositories and upgrade existing packages
sudo apt update
sudo apt upgrade -y

# Install zsh
sudo apt install -y zsh

# Make zsh default shell
chsh -s $(which zsh)

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-autosuggestions plugin
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Install RVM (Ruby Version Manager)
curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -
curl -sSL https://get.rvm.io | bash -s stable

# Install GPG2
sudo apt install -y gpg2

# Install NVM (Node Version Manager)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Install Yarn package manager
npm install --global yarn
