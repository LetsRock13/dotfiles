autoload -Uz vcs_info

precmd() {
	vcs_info
	print -P "%B%F{#08AD29}[%~]%f%b $vcs_info_msg_0_"
}

zstyle ':vcs_info:*' formats '%B%F{#0DB0D8}->%f %F{#0DB0D8}(%f%F{#7E0ACC}%b%f%F{#0DB0D8})%f'

PROMPT='%F{#0DB0D8}->%f '
