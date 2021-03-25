source $HOME/.antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle dotenv
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen theme romkatv/powerlevel10k

antigen apply

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ALIASES

alias ss="cmatrix -s"
alias home="cd ~"

alias src="exec zsh"
alias bashrc="vim ~/.bashrc"
alias zshrc="vim ~/.zshrc"
alias p10krc="vim ~/.p10k.zsh"

alias py="python3"
alias js="node"
alias ts="ts-node"

alias docker_run="docker run -dti -v /home/atlasrw/.data:/root/.data"

# FUNCTIONS

docker_new(){
  # docker_new IMAGE NAME PORTS
  if [[ $3 ]]; then
    docker run -dti -v /home/atlasrw/.data:/root/.data -v /home/atlasrw/.data/.ssh:/root/.ssh --name $2 -p $3 $1
  else
    docker run -dti -v /home/atlasrw/.data:/root/.data -v /home/atlasrw/.data/.ssh:/root/.ssh --name $2 $1
  fi
  docker_build $1 $2
}

docker_build(){
  # docker_build IMAGE NAME
  case $1 in
    'node'*)
      docker exec -ti $2 /bin/bash /root/.data/node.sh
      ;;
    'python'*)
      docker exec -ti $2 /bin/bash /root/.data/python.sh
      ;;
    'php'*)
      docker exec -ti $2 /bin/bash /root/.data/php.sh
      ;;
    'httpd'*)
      docker exec -ti $2 /bin/bash /root/.data/httpd.sh
      ;;
    *)
      docker exec -ti $2 /bin/bash /root/.data/build.sh
      ;;
  esac
}