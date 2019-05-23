#!/bin/bash
Echo "Onboarding..."

Echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Echo "Installing iTerm..."
brew cask install iterm2

Echo "Installing zsh..."
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
Echo "currently using version $(zsh --version | awk '{print $1 $2}') upgrading..."
upgrade_oh_my_zsh
mv kube-ps1.sh /usr/local/opt/kube-ps1/share/
mv .kubectl_aliases .zshrc ~/
Echo "Installing Golang..."
brew install go 
Echo "Installing Docker..."
brew cask install docker
pip install docker-compose
Echo "Installing AWS-CLI..."
pip install aws
Echo "Installing aws-login helper"
curl -L -o /tmp/aws-login-helper.zip https://git.obsec.run/jturpin/eks-login-helper/-/archive/master/eks-login-helper-master.zip && pip3 install /tmp/aws-login-helper.zip --upgrade
aws-login-helper.py
Echo "Installing Kubectl... "
brew install kubernetes-cli
Echo "Installing Helm..."
brew install kubernetes-helm
Echo "Installing VSCode..."
brew cask install visual-studio-code
