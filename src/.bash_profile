# .bash_profile

exec zsh;

export PS1="\[\e[0;36m\]Ryan\w\$ \[\e[m\]"
export LS_COLORS=$LS_COLORS:'di=0;32:'
export CLICOLOR=1


# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH