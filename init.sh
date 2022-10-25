# This is for Mac computers with Apple silicon: https://support.apple.com/en-us/HT211814
# For Mac computers with Intel processors see https://gist.github.com/freshlogic/3cc0c776f0dee635edc5781a62065b43

# Rosetta 2
/usr/sbin/softwareupdate --install-rosetta --agree-to-license

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval $(/opt/homebrew/bin/brew shellenv)' >> ~/.zprofile
eval $(/opt/homebrew/bin/brew shellenv)

# AWS CLI
brew install awscli

# Docker Desktop
brew install --cask docker

# MongoDB
brew tap mongodb/brew
brew install mongodb-community@4.0
echo 'export PATH="/opt/homebrew/opt/mongodb-community@4.0/bin:$PATH"' >> ~/.zshrc
brew services start mongodb/brew/mongodb-community@4.0

# Redis
brew install redis
brew services start redis

# NVM
touch ~/.zshrc
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
nvm install 16

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
