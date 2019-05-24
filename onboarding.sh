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
    brew install $p
done

Echo "Installing aws login helper"
curl -L -o /tmp/aws-login-helper.zip https://git.obsec.run/jturpin/eks-login-helper/-/archive/master/eks-login-helper-master.zip && pip3 install /tmp/aws-login-helper.zip --upgrade
aws-login-helper.py

for t in "${taps[@]}"
do
    echo "installing $t ..."
    brew install $t
done

for c in "${casks[@]}"
do
    echo "installing $c ..."
    brew install $c
done

for b in "${beers[@]}"
do
    echo "installing $b ..."
    brew install $b
done

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
upgrade_oh_my_zsh