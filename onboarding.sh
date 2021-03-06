#!/bin/bash
Echo "Onboarding..."

Echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Echo "Moving configs..."
mv kube-ps1.sh /usr/local/opt/kube-ps1/share/
mv .kubectl_aliases .zshrc ~/
mv .tmux.conf ~/

declare -a taps=()
declare -a casks=("iterm2" "docker" "visual-studio-code")
declare -a beers=("go" "erlang" "rebar3" "scala" "node" "tmux" "kubernetes-cli" "kubernetes-helm" "zsh")
declare -a pips=("docker-compose" "aws")

for p in "${pips[@]}"
do
    echo "installing $p ..."
    pip install $p
done

for t in "${taps[@]}"
do
    echo "installing $t ..."
    brew tap $t
done

for c in "${casks[@]}"
do
    echo "installing $c ..."
    brew cask install $c
done

for b in "${beers[@]}"
do
    echo "installing $b ..."
    brew install $b
done

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
upgrade_oh_my_zsh
