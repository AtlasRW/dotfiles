source $HOME/.antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
#antigen bundle heroku
#antigen bundle pip
#antigen bundle lein
#antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
antigen theme romkatv/powerlevel10k

# Tell Antigen that you're done.
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

alias docker_run="docker run -dti -v /home/atlasrw/.data:/root/.data"

alias py="python3"
alias js="node"

# FUNCTIONS
docker_new(){
  t=$1_$RANDOM
  docker run -dti -v /home/atlasrw/.data:/root/.data --name $t $1
  docker_build $t
}
docker_build(){
  docker exec -ti $1 /bin/bash /root/.data/build.sh
;}