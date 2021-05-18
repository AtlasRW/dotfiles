## ENVIRONMENT

export VISUAL=nano
export EDITOR="$VISUAL"

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

alias py="python3"
alias js="node"
alias ts="ts-node"
alias pip="poetry"

alias docker_run="docker run -dti -v /home/atlasrw/.data:/root/.data -v /home/atlasrw/.ssh:/root/.ssh"

## FUNCTIONS

docker_new(){
  # docker_new IMAGE NAME PORTS
  if [[ $3 ]]; then
    docker run -dti -v /home/atlasrw/.data:/root/.data -v /home/atlasrw/.ssh:/root/.ssh --name $2 -p $3 $1 ${@:4}
  else
    docker run -dti -v /home/atlasrw/.data:/root/.data -v /home/atlasrw/.ssh:/root/.ssh --name $2 $1
  fi
  docker_build $1 $2
}

docker_build(){
  # docker_build IMAGE NAME
  case $1 in
    'kali'*)
      docker exec -ti $2 /bin/bash /root/.data/kali.sh
      ;;
    'node'*)
      docker exec -ti $2 /bin/bash /root/.data/node.sh
      ;;
    'python'*)
      docker exec -ti $2 /bin/bash /root/.data/python.sh
      ;;
    'php'*)
      docker exec -ti $2 /bin/bash /root/.data/php.sh
      ;;
    'nginx'*)
      docker exec -ti $2 /bin/bash /root/.data/nginx.sh
      ;;
    'httpd'*)
      docker exec -ti $2 /bin/bash /root/.data/httpd.sh
      ;;
    *)
      docker exec -ti $2 /bin/bash /root/.data/build.sh
      ;;
  esac
}