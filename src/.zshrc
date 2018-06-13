# CONFIGURE COLORS
autoload -U colors && colors
PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "

# LEFT PROMPT
PROMPT="%{$fg[magenta]%}%~ %{$fg[green]%}% ::: %{$reset_color%}"

# RIGHT/GIT PROMPT
#https://stackoverflow.com/questions/1128496/to-get-a-prompt-which-indicates-git-branch-in-zsh
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{2}[%F{5}%b%F{3}|%F{1}%a%F{2}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{2}[%F{5}%b%F{2}]%f '
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


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# added by Anaconda3 installer
export PATH="/Users/RyanAFinley/anaconda3/bin:$PATH"

# needed for 'stack' (haskell package manager)
export PATH="/Users/RyanAFinley/.local/bin:$PATH"

# scan-build, scan-view: "checker-279"
export PATH="/Users/RyanAFinley/Library/CTools/checker-279/bin:$PATH"i

# API KEYS
export SPOTIFY_KEYS='[{"uid": "74e263a989264f4ebce7239dd8933c79","usec": "d1428843c1cc49a78a7aa8c62a3cfe46",},{"uid    ": "0ed617d0658e44b29f7feaad2c39f73c","usec": "ea92364aaf024759b35cc0bc42f4e762",},{"uid": "f894446f45df4885a22631c    0e40488a9","usec": "f30cd87fefc240d4bf166572a38da235",}]'

# SET to develop ElasticSearch in java
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-9.0.4.jdk/Contents/Home"
