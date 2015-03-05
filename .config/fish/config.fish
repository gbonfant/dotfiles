set fish_greeting

set cdpath $HOME/Projects

set -x EDITOR "vim"
set -x CDPATH . ~ $cdpath
set -x RUBYGEMS_GEMDEPS -
set -U fish_user_paths /usr/local/sbin

# rbenv
status --is-interactive; and . (rbenv init -|psub)

alias p=prevd
alias n=nextd
