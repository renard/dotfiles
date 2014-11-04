#export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"'


export PS1='\u@\h:\w \$ '

case $TERM in
    xterm-256color) export PS1="\[\e]0;\u@\h: \w\a\]$PS1"
esac  

export PROMPT_COMMAND=

for f in .profile .locale; do
    if [ -f "$HOME/$f" ]; then
	. "$HOME/$f"
    fi
done

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

export PYTHONPATH="$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH"


if [ -e "$HOME/.rbenv/bin" ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
    eval "$(rbenv init -)"
fi
