/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" \
brew tap caskroom/cask
brew cask install \
google-chrome \
telegram \
slack

# Development
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

brew cask install visual-studio-code \
nvm install node \
npm install -g @vue/cli \
npm i -g now \
brew install yarn
brew cask install firefox

# Entertainment
brew cask install \
spotify \
vlc
