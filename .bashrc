# ~~ bash config ~~

# change bash prompt
if [ "$HOSTNAME" = "Aidans-MacBook-Pro.local" ] && [ "$USER" = "aidanmiles" ]; then
    export PS1="\[\e[1m\] \W \$\[\e[0m\] "
else
    export PS1="\[\e[1m\]\u@\h: \W\$\[\e[0m\] "
fi

# source shell config
source ~/.shrc
