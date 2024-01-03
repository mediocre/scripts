# This is for Mac computers with Apple silicon: https://support.apple.com/en-us/HT211814

# Rosetta 2
#/usr/sbin/softwareupdate --install-rosetta --agree-to-license

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# AWS CLI
brew install awscli

# MongoDB
brew tap mongodb/brew
brew install mongodb-community@4.4
echo 'export PATH="/opt/homebrew/opt/mongodb-community@4.4/bin:$PATH"' >> ~/.zshrc
brew services start mongodb/brew/mongodb-community@4.4

# Redis
brew install redis
brew services start redis

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 20

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

# MongoDB Compass
brew install mongodb-compass

# ngrok
brew install ngrok

# Visual Studio Code
brew install visual-studio-code

# Visual Studio Code Extensions
code --install-extension dbaeumer.vscode-eslint
code --install-extension DigitalBrainstem.javascript-ejs-support
code --install-extension GitHub.copilot
code --install-extension ms-vsliveshare.vsliveshare

# Mac App Store CLI
brew install mas

# Azure VPN Client
mas install 1553936137

# Slack
mas install 803453959

# GitHub CLI
brew install gh
gh auth login
