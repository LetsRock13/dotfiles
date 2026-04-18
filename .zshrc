export LANG=de_DE.UTF-8
export LANGUAGE=de_DE.UTF-8
export LC_ALL=de_DE.UTF-8

bindkey -e

# Load my prompt 
source ~/dotfiles/zshconf/.myprompt.zsh

# Include zplug file
source ~/dotfiles/zshconf/.zplug.zsh

# Colorize "man"
source ~/dotfiles/colorman/colorman

# Start ssh-agent for example for github
if [ -f "$HOME/.start_ssh-agent" ]; then
	source $HOME/.start_ssh-agent

	## Add private ssh keys
    if [ -f "$HOME/.ssh/wsl_debian" ]; then
	    ssh-add -q "$HOME/.ssh/wsl_debian"
    fi

    if [ -f "$HOME/.ssh/gitlab" ]; then
	    ssh-add -q "$HOME/.ssh/gitlab"
    fi

    if [ -f "$HOME/.ssh/archThinkPad" ]; then
	    ssh-add -q "$HOME/.ssh/archThinkPad"
    fi
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
    if [ $DOTNET_ROOT != "" ]; then
        export PATH="$PATH:$DOTNET_ROOT:$DOTNET_ROOT/tools"
    fi
fi

if [ -d "/opt/openjdk-21.0.8" ]; then
	export JAVA_HOME="/opt/openjdk-21.0.8"
fi

<<<<<<< HEAD
if [ -d "${HOME}/opt/bin/gf" ]; then
	export GF_HOME="${HOME}/opt/bin/gf"
fi

if [ -d "${HOME}/opt/bin/flutter/bin" ]; then
	export FLUTTER_HOME="${HOME}/opt/bin/flutter/bin"
fi

if [ -d "${HOME}/opt/bin/kotlinc/bin" ]; then
	export KOTLIN_HOME="${HOME}/opt/bin/kotlinc/bin"
fi

if [ -d "${HOME}/opt/bin/kotlin-native/bin" ]; then
	export KOTLIN_NATIVE_HOME="${HOME}/opt/bin/kotlin-native/bin"
fi

if [ -d "${HOME}/opt/bin/gradle-9.3.1/bin" ]; then
	export GRADLE_HOME="${HOME}/opt/bin/gradle-9.3.1/bin"
fi

if [ -d "$HOME/.cargo/bin" ]; then
    export PATH="$PATH:$HOME/.cargo/bin"
fi

export DOTNET_CLI_TELEMETRY_OPTOUT=1

export RAYLIB_LIB_PATH="/opt/raylib/lib"
export RAYLIB_INCLUDE_PATH="/opt/raylib/include"
export LD_LIBRARY_PATH="/usr/local/lib:$RAYLIB_LIB_PATH"
export C_INCLUDE_PATH="/usr/local/include:$RAYLIB_INCLUDE_PATH"
export ZIG_HOME="/opt/zig"
export JAVA_HOME="/usr/lib/jvm/java-21-openjdk-amd64"

export PATH="$PATH:/opt/tmux"
export PATH="$PATH:$JAVA_HOME"
export PATH="$PATH:$JAVA_HOME/bin/java"
export PATH="$PATH:$JAVA_HOME/bin/javac"
export PATH="$PATH:$ZIG_HOME"
export PATH="$PATH:$GF_HOME"
export PATH="$PATH:$FLUTTER_HOME"
export PATH="$PATH:$KOTLIN_HOME"
export PATH="$PATH:$KOTLIN_NATIVE_HOME"
export PATH="$PATH:$GRADLE_HOME"

alias ls='exa'
alias ll='exa -la'
alias lt='exa -lT'
alias llt='exa -laT'
alias cat='bat --decorations=always --color=always --theme=Dracula'
alias cl='clear'
alias tldr='tldr --color always'
alias lg='lazygit'
alias cdps='cd /mnt/e/repos/poststream/'
alias cddb='cd /mnt/e/repos/postStream\ Server\ Umzug'
alias cdxml='cd /mnt/e/repos/XmlTransform'
alias cdai='cd /mnt/e/repos/autoimporter-2.0'
alias devlog='nvim /mnt/c/Users/Robert\ Hingst/Documents/_devLog/DEV_Log.txt'
alias nvimconf='nvim ~/.config/nvim/.'
alias gtypist='gtypist ttde.typ' 
alias cdcrm='cd /mnt/e/repos/postStream\ CRM'
alias zen='flatpak run app.zen_browser.zen&'

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
