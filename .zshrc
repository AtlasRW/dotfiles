## ENVIRONMENT

export VISUAL=nano
export EDITOR="$VISUAL"

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
# export JAVA_HOME="/opt/homebrew/opt/openjdk"
# export JRE_HOME="$JAVA_HOME"

export PATH="$HOME/.local/bin":$PATH
# export PATH="$JAVA_HOME/bin:$PATH"

## ANTIGEN

source $HOME/.antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle darvid/zsh-poetry
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen theme romkatv/powerlevel10k

antigen apply

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## ALIASES

alias ss="cmatrix -s"
alias home="cd ~"

#alias open="nano"
alias src="exec zsh"
alias bashrc="nano ~/.bashrc"
alias zshrc="nano ~/.zshrc"
alias nanorc="nano ~/.nanorc"
alias p10krc="nano ~/.p10k.zsh"

alias js="node"
alias ts="ts-node"
alias py="python3"
alias py3="python3"
alias py2="python2"
alias pip="pip3"
# alias pip="poetry"
alias rust="rustc"
alias rs="rustc"
alias ytdl="yt-dlp"
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"

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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/raphael/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/raphael/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/raphael/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/raphael/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


fpath+=~/.zfunc; autoload -Uz compinit; compinit

zstyle ':completion:*' menu select
