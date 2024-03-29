## ENVIRONMENT

export VISUAL=nano
export EDITOR="$VISUAL"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"

## ANTIGEN

source $HOME/.antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle dotenv
antigen bundle darvid/zsh-poetry
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen theme romkatv/powerlevel10k

antigen apply

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## ALIASES

alias ss="cmatrix -s"
alias home="cd ~"

alias open="nano"
alias src="exec zsh"
alias bashrc="nano ~/.bashrc"
alias zshrc="nano ~/.zshrc"
alias nanorc="nano ~/.nanorc"
alias p10krc="nano ~/.p10k.zsh"

alias js="node"
alias ts="ts-node"
alias py="python"
alias py3="python3"
alias py2="python2"
alias pip="poetry"

alias docker_run="docker run -dti -v /home/atlasrw/.data:/root/.data -v /home/atlasrw/.ssh:/root/.ssh"


## FUNCTIONS

docker_new(){
  # docker_new IMAGE NAME PORTS OTHERS
  if [[ $3 ]]; then
    docker run -dti -v /home/atlasrw/.data:/root/.data -v /home/atlasrw/.ssh:/root/.ssh --name "$2" -p "$3" "$1" "${@:4}"
  else
    docker run -dti -v /home/atlasrw/.data:/root/.data -v /home/atlasrw/.ssh:/root/.ssh --name "$2" -P "$1"
  fi
  docker_build "$1" "$2"
}

docker_build(){
  # docker_build IMAGE NAME
  case $1 in
    'httpd'*)
      docker exec -ti "$2" /bin/bash /root/.data/httpd.sh
      ;;
    'kali'*)
      docker exec -ti "$2" /bin/bash /root/.data/kali.sh
      ;;
    'nginx'*)
      docker exec -ti "$2" /bin/bash /root/.data/nginx.sh
      ;;
    'node'*)
      docker exec -ti "$2" /bin/bash /root/.data/node.sh
      ;;
    'php'*)
      docker exec -ti "$2" /bin/bash /root/.data/php.sh
      ;;
    'python'*)
      docker exec -ti "$2" /bin/bash /root/.data/python.sh
      ;;
    'rust'*)
      docker exec -ti "$2" /bin/bash /root/.data/rust.sh
      ;;
    *)
      docker exec -ti "$2" /bin/bash /root/.data/build.sh
      ;;
  esac
}
