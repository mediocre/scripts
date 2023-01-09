# This is for Mac computers with Apple silicon: https://support.apple.com/en-us/HT211814

# Remove all apps from macOS dock
defaults write com.apple.dock persistent-apps -array

# Rosetta 2
#/usr/sbin/softwareupdate --install-rosetta --agree-to-license

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# AWS CLI
brew install awscli

# Docker Desktop
brew install --cask docker

# MongoDB
brew tap mongodb/brew
brew install mongodb-community@4.2
echo 'export PATH="/opt/homebrew/opt/mongodb-community@4.2/bin:$PATH"' >> ~/.zshrc
brew services start mongodb/brew/mongodb-community@4.2

# Redis
brew install redis
brew services start redis

# NVM
#touch ~/.zshrc
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 18

# Downgrade to NPM 6
npm install -g npm@6

# npmclean
echo 'alias npm-clean="rm -rf node_modules/ && rm -f package-lock.json && npm i && npm outdated"' >> ~/.zshrc
alias npm-clean="rm -rf node_modules/ && rm -f package-lock.json && npm i && npm outdated"

# ESLint
npm i eslint -g

# PM2
npm i pm2 -g

# GitHub Desktop
brew install github
open /Applications/GitHub\ Desktop.app

# MongoDB Compass
brew install mongodb-compass
open /Applications/MongoDB\ Compass.app

# ngrok
brew install ngrok

# Visual Studio Code
brew install visual-studio-code
open /Applications/Visual\ Studio\ Code.app

# Visual Studio Code Extensions
code --install-extension dbaeumer.vscode-eslint
code --install-extension ms-vsliveshare.vsliveshare

# Mac App Store CLI
brew install mas

# Azure VPN Client
mas install 1553936137

# Slack
mas install 803453959
open /Applications/Slack.app

# GitHub CLI
brew install gh
gh auth login
