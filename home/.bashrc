[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1="\[\e[1;37m\] \w \[\e[1;36m\]\[\e[1;37m\] "
echo ""
neofetch
echo ""