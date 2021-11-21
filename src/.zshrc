autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

# Path to your oh-my-zsh installation.
export ZSH="/Users/ryanfinley/.oh-my-zsh"
ZSH_THEME="rafin"
plugins=(fast-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# HISTORY -----------------------------------------------------------
SAVEHIST=5000
HISTFILE=~/.zsh_history

# ENHANCE COMMON ----------------------------------------------------
export GREP_OPTIONS='--color=auto' # make grep highlight results using color
alias ls='ls --color=auto -hFG' # force ls to always use color and type indicators
alias vim='vim -p' # force vim to open multiple files in tabs
alias vi='vim -p'
alias vimro='vim -p -R' # force vim to open multiple READ ONLY files in tabs
alias dc='cd'
alias watchtail="watch -n 1 tail -n 20"

# FIX END/HOME KEYS ------------------------------------------------
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# GENERAL ALIASES ---------------------------------------------------
function vim-grep () {
    vim $(grep -Rl "$@" ./*)
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -z "$TMUX" ]; then
    # we're not in a tmux session
    if [ ! -z "$SSH_CLIENT" ]; then
        # We logged in via SSH
        # if ssh auth variable is missing
        if [ -z "$SSH_AUTH_SOCK" ]; then
            export SSH_AUTH_SOCK="$HOME/.ssh/.auth_socket"
        fi
        # if socket is available create the new auth session
        if [ ! -S "$SSH_AUTH_SOCK" ]; then
            `ssh-agent -a $SSH_AUTH_SOCK` > /dev/null 2>&1
            echo $SSH_AGENT_PID > $HOME/.ssh/.auth_pid
        fi
        # if agent isn't defined, recreate it from pid file
        if [ -z $SSH_AGENT_PID ]; then
            export SSH_AGENT_PID=`cat $HOME/.ssh/.auth_pid`
        fi
        # Add all default keys to ssh auth
        ssh-add 2>/dev/null
        # start tmux
        tmux attach
    fi
fi

function viewcsv () {
  perl -pe 's/((?<=,)|(?<=^)),/ ,/g;' "$@" | column -t -s, | less  -F -S -X -K
}

# find path to file provided recursively
function ff() {
  find ~/ -type f -name "$1*"
}

{
  function t2h() {
    if [ -z "$1" ]; then
      echo "Usage: t2h \$time"
      return 1
    fi
    python -c "import time,sys; arg = sys.argv[1]; digits = len(arg) - 10; whole = long(arg) // 10**digits; frac = long(arg) % 10**digits; fracStr = ('%%.0%dd' % digits) % frac; print time.strftime('%Y-%m-%d %H:%M:%S', time.localtime(whole)) + '.' + fracStr" $1
  }
  export -f t2h

  function h2t() {
      if [ -z "$1" ]; then
        echo "Usage: h2t \$time"
        return 1
      fi
      python -c "import time,sys; args = sys.argv[1:]; arg = ' '.join(args); (time_s, time_ns) = arg.split('.'); print '%d%s' % (time.mktime(time.strptime(time_s, '%Y-%m-%d %H:%M:%S')), time_ns)" $1
  }
  export -f h2t
} &> /dev/null

# JUMP COMMON -------------------------------------------------------
# extra source files
source ~/.torc

# locally built plugins
PATH=$HOME/.plugins/bin:$PATH
PATH=~/.local/bin:$PATH