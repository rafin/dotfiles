# CONFIGURE COLORS
autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "

# LEFT PROMPT
PROMPT="%{$fg[magenta]%}%~ %{$fg[green]%}% ::: %{$reset_color%}"

# RIGHT/GIT PROMPT
#https://stackoverflow.com/questions/1128496/to-get-a-prompt-which-indicates-git-branch-in-zsh
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats '%F{2}[%F{5}%b%F{3}|%F{1}%a%F{2}]%f '
zstyle ':vcs_info:*' formats '%F{2}[%F{5}%b%F{2}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'
zstyle ':vcs_info:*' enable git cvs svn
# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
  fi
}
RPROMPT=$'$(vcs_info_wrapper)'

# HISTORY -----------------------------------------------------------
SAVEHIST=500
HISTFILE=~/.zsh_history

# ENHANCE COMMON ----------------------------------------------------
export GREP_OPTIONS='--color=auto' # make grep highlight results using color
alias ls='ls -hFG' # force ls to always use color and type indicators
alias vim='vim -p' # force vim to open multiple files in tabs

# GENERAL ALIASES ---------------------------------------------------
function vim-grep () {
    vim $(grep -Rl "$@" ./*)
}
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias ezmake="g++ -std=c++17"

# SYSTEM SPECIFIC ALIASES -------------------------------------------
# put all private configurations here
touch ~/.zshrc_custom
source ~/.zshrc_custom
