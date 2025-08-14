bindkey -v

# Load my prompt 
source ~/dotfiles/zshconf/.myprompt.zsh

# Include zplug file
source ~/dotfiles/zshconf/.zplug.zsh

# You may need to manually set your language environment
export LANG=de_DE.UTF-8

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

export PATH="$PATH:/opt/tmux"
export RAYLIB_LIB_PATH="/opt/raylib/lib"
export RAYLIB_INCLUDE_PATH="/opt/raylib/include"
export LD_LIBRARY_PATH="/usr/local/lib:$RAYLIB_LIB_PATH"
export C_INCLUDE_PATH="/usr/local/include:$RAYLIB_INCLUDE_PATH"
export ZIG_HOME="/opt/zig"
export PATH="$PATH:$ZIG_HOME"
export JAVA_HOME="/usr/lib/jvm/java-21-openjdk-amd64"

alias vim='nvim'
alias ls='exa'
alias ll='exa -la'
alias lt='exa -lT'
alias llt='exa -laT'
alias cat='batcat --decorations=always --color=always --theme=Dracula'
alias cl='clear'
alias tldr='tldr --color always'
alias lg='lazygit'

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
