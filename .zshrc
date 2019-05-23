# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

#erlang shiz
export PATH=~/.cache/rebar3/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="~/.oh-my-zsh"

# Kubectl Aliases
[ -f ~/.kubectl_aliases ] && source ~/.kubectl_aliases
function kubectl() { echo "+ kubectl $@"; command kubectl $@; }

export KUBECONFIG=$KUBECONFIG:~/.kube/config:~/.kube/config-shared.pdx1.aws.dev:~/.kube/config-shared.pdx1.aws.ops:~/.kube/config-shared.pdx1.aws.qe:~/.kube/config-shared.pdx1.aws.live

# Common repo aliases (Currently setup in gopath)
export BACKEND="$HOME/go/src/git.obsec.run/backend"
export DEVOPS="$HOME/go/src/git.obsec.run/devops"
export DATASCIENCE="$HOME/go/src/git.obsec.run/datascience"
export DATAPLATFORM="$HOME/go/src/git.obsec.run/devops"
export RETRIEVERS="$HOME/go/src/git.obsec.run/retrievers"

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

export DEV_CONFIGS="$GOPATH/src/git.obsec.run/.dev"

plugins=(
  git
)

source ~/.bash_profile_gpg_conf
source $ZSH/oh-my-zsh.sh
