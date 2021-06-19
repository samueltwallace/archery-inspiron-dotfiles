# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/samueltwallace/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#

PROMPT='%F{blue}%B%n%b@%M:%~%f'$'\n\n''%(?.%F{blue}.%F{red})%! @ %* '$'\U27A0%f '

export PATH=$HOME/.local/bin:$PATH

function precmd() {
	print '\n'
}


function vimconfig() {
	if [[ -n "$2" ]]; then
		nvim -u $HOME/.config/modvim/$1 $2
	else
		nvim -u $HOME/.config/modvim/$1 $(fzf --reverse --height=15)
	fi
}



function split() {
	tmux split-window -$1
}

function cz() {
	cd $(find **/ | fzf --reverse --height=15)
}

function rsearch() {
	cat $HOME/.bookmarks | rg "$@" | cut -d';' -f 4
}

function ld() {
	mkdir $@ && cd $@
}

function fetch () {
    neofetch --ascii $HOME/.local/share/$1.ascii
}

alias refresh='clear && exec $SHELL -l'
alias :q='exit'
alias zearch='cat $HOME/.bookmarks | fzf --reverse --height=15 | cut -d ";" -f 4'
alias lss='ls -Ahl --color=auto'
alias mstat='top -b -n 1 -o %MEM | head'
alias cstat='top -b -n 1 -o %CPU | head'
alias config='git --git-dir=$HOME/repos/archery-inspiron-dotfiles --work-tree=$HOME'
alias shortwttr='curl -s wttr.in | head -n 7'
alias ed='emacsclient -n'
