export EDITOR=/opt/homebrew/bin/nvim

export PATH=$PATH:/opt/homebrew/bin

export LSCOLORS=exfxcxdxbxegedabagacad
export CLICOLOR=1
alias ls='ls -G'

autoload -Uz add-zsh-hook
autoload -Uz vcs_info

add-zsh-hook precmd vcs_info

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{cyan}%~%f %F{green}(${vcs_info_msg_0_})%f  %# '

