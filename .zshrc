# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#erlang shiz
export PATH=~/.cache/rebar3/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Kubectl Aliases
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
function kubectl() { echo "+ kubectl $@"; command kubectl $@; }

source "/usr/local/opt/kube-ps1/share/kube-ps1.sh"
PS1='$(kube_ps1)'$PS1

# Docker Aliases
alias docker-clean=dockerClean
dockerClean () {
  docker kill $(docker ps -q)
  docker rm $(docker ps -a -q)
  docker system prune -f
}

#K8 and helm env switching 
alias env-qe="useKubeConfig qe && useHelmCerts qe"
alias env-live="useKubeConfig live && useHelmCerts live"
alias env-dev="useKubeConfig dev && useHelmCerts dev"
alias env-local="kubectl config use-context docker-for-desktop"
useKubeConfig() {
  kubectl config use-context shared.pdx1.aws.$1
}
useHelmCerts() {
  cp ~/.helm/certs/$1/*.pem ~/.helm
} 

# GOPATH
export PATH=$PATH:$HOME/go/bin
export GOPATH="$HOME/go"
export GOROOT=/usr/local/opt/go/libexec

plugins=(
  git
)

export TERM="xterm-256color"
ZSH_THEME="robbyrussell"

source $ZSH/oh-my-zsh.sh
