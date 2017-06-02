# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >>~/.bash_profile


#easy access to bash profile
alias profile='subl ~/.bashrc'

#shorthand commands for applications
alias sbl='subl .'
alias chrome='google-chrome-stable'
alias chrome!='google-chrome-stable & exit'
chrome-open (){ 
google-chrome-stable www."$1".com 
}
phase2! (){ 
google-chrome-stable https://github.com/chi-squirrels-2017/phase-2-guide & exit 
}
phase2 (){ 
google-chrome-stable https://github.com/chi-squirrels-2017/phase-2-guide 
}
configz (){ 
google-chrome-stable https://github.com/khan1782/Useful-Configurations 
}
configz! (){ 
google-chrome-stable https://github.com/khan1782/Useful-Configurations 
}
music (){
google-chrome-stable https://pandora.com & exit
}

#apt commands
alias apt-get='sudo apt-get'
alias install='sudo apt-get install'
alias searchfor='sudo apt-cache search'
alias filem='thunar'
alias space='du -sh'

#shorthand commands
alias c='cd'
alias ..='cd ..'
alias ...='cd ../../../' 
alias ....='cd ../../../../'\
alias x='clear && ls'
alias c='clear'
alias l='ls'
mkcdir ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

#git commands
alias clone='git clone'
alias gs='git status'
alias gcb='git checkout -b'
alias ga='git add --all'
alias gc='git commit'
alias gac='git add --all && git commit -m'
alias gpo='git push origin'

#sinatra app commands
alias be='bundle exec'
alias dbdrop='bundle exec rake db:drop'
alias dbcreate='bundle exec rake db:create'
alias dbmigrate='bundle exec rake db:migrate'
alias dbseed='bundle exec rake db:seed'
alias dbreset='bundle exec rake db:drop && bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rake db:seed'
alias console='clear && bundle exec rails console'
alias bes='bundle exec shotgun'
alias generatemigration='bundle exec rake generate:migration'
alias generatemodel='bundle exec rake generate:model'

#dir commands
alias temp='cd /home/kevin/temp/ && x'

alias whatsrunning='ps aux | grep ruby'
alias restartpostgres='sudo /etc/init.d/postgresql restart' 

alias gem='sudo gem'

alias rs='rails server'

alias qships='git clone http://github.com/khan1782/q-ships'
alias ns='node server.js'
alias pew='git remote add dokku dokku@174.138.68.225:pewships'
alias nodeserver='ssh root@174.138.62.21'
alias headphones="amixer -c 0 cset name='DAC1 MIXL DAC1 Switch' on && amixer -c 0 cset name='DAC1 MIXR DAC1 Switch' on && amixer -c 0 cset name='Speaker Switch' off && amixer -c 0 cset name='Stereo DAC MIXL DAC1 R Switch' off && amixer -c 0 cset name='Stereo DAC MIXR DAC1 L Switch' off && amixer -c 0 cset name='Stereo DAC MIXL DAC1 L Switch' on && amixer -c 0 cset name='Stereo DAC MIXR DAC1 R Switch' on && amixer -c 0 cset name='OUT1 Playback Switch' on && amixer -c 0 cset name='OUT2 Playback Switch' on && amixer -c 0 cset name='Headphone Switch' on && music"
 





### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
