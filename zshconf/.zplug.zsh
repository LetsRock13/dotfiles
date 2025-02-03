source ~/.zplug/init.zsh

# Lets Zplug manage itself
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "zsh-users/zsh-history-substring-search"

# Include a batter vim support for zsh 
zplug "jeffreytse/zsh-vi-mode"

# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
	zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load
