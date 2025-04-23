export LANG=de_DE.UTF-8
export LANGUAGE=de_DE.UTF-8
export LC_ALL=de_DE.UTF-8

bindkey -v

# Load my prompt 
source ~/dotfiles/zshconf/.myprompt.zsh

# Include zplug file
source ~/dotfiles/zshconf/.zplug.zsh

# Start ssh-agent for example for github
if [ -f "$HOME/.start_ssh-agent" ]; then
	source $HOME/.start_ssh-agent

	## Add private ssh keys
	ssh-add -q "$HOME/.ssh/wsl_debian"
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zshconfig="nvim ~/.dotfiles/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


if [ -d "$HOME/.dotnet" ]; then
	export DOTNET_ROOT="$HOME/.dotnet"
fi

if [ $DOTNET_ROOT != "" ]; then
	export PATH="$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools"
fi

if [ "/opt/openjdk-21.0.6" != "" ]; then
	export JAVA_HOME="/opt/openjdk-21.0.6"
fi

export PATH="$PATH:/opt/tmux"
export RAYLIB_LIB_PATH="/opt/raylib/lib"
export RAYLIB_INCLUDE_PATH="/opt/raylib/include"
export LD_LIBRARY_PATH="/usr/local/lib:$RAYLIB_LIB_PATH"
export C_INCLUDE_PATH="/usr/local/include:$RAYLIB_INCLUDE_PATH"
export ZIG_HOME="/opt/zig_0.13.0"
export PATH="$PATH:$JAVA_HOME"
export PATH="$PATH:$ZIG_HOME"

alias ls='exa'
alias ll='exa -la'
alias lt='exa -lT'
alias llt='exa -laT'
alias cat='batcat --decorations=always --color=always --theme=Dracula'
alias cl='clear'
alias tldr='tldr --color always'
alias lg='lazygit'
alias cdps='cd /mnt/e/repos/poststream/'
alias cddb='cd /mnt/e/repos/postStream\ Server\ Umzug'
alias devlog='nvim /mnt/c/Users/Robert\ Hingst/Documents/_devLog/DEV_Log.txt'
alias nvimconf='nvim ~/.config/nvim/.'
alias gtypist='gtypist ttde.typ' 

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
