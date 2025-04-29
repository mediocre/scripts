# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# AWS CLI
#brew install awscli

# MongoDB
brew tap mongodb/brew
brew install mongodb-community@8.0
brew services start mongodb-community@8.0

# Redis
brew install redis
brew services start redis

# NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install 22

# Downgrade to NPM 6
npm install -g npm@6

# npmclean
echo 'alias npm-clean="rm -rf node_modules/ && rm -f package-lock.json && npm i && npm outdated"' >> ~/.zshrc
alias npm-clean="rm -rf node_modules/ && rm -f package-lock.json && npm i && npm outdated"

# ESLint
npm i eslint -g
npm i @eslint/js -g

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
code --install-extension GitHub.copilot-chat
code --install-extension mechatroner.rainbow-csv
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
