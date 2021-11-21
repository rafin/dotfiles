# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

export PS1="\[\e[0;36m\]Ryan\w\$ \[\e[m\]"
export LS_COLORS=$LS_COLORS:'di=0;32:'
export CLICOLOR=1


# User specific aliases and functions