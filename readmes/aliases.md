# Useful Aliases #

__easy access to bash profile__

	alias profile='subl ~/.bashrc'

__shorthand commands for applications__

	alias sbl='subl .'
	alias chrome='google-chrome-stable'

__apt commands__

	alias apt-get='sudo apt-get'
	alias install='sudo apt-get install'
	alias searchfor='sudo apt-cache search'

__shorthand commands__

	alias c='cd'
	alias ..='cd ..'
	alias ...='cd ../../../' 
	alias ....='cd ../../../../'\
	alias x='clear && ls'
	alias c='clear'
	alias l='ls'

__git commands__

	alias clone='git clone'
	alias gs='git status'
	alias gcb='git checkout -b'
	alias ga='git add --all'
	alias gc='git commit'
	alias gac='git add --all && git commit -m'
	alias gp='git push origin'

__sinatra app commands__

	alias be='bundle exec'
	alias dbdrop='bundle exec rake db:drop'
	alias dbcreate='bundle exec rake db:create'
	alias dbmigrate='bundle exec rake db:migrate'
	alias dbseed='bundle exec rake db:seed'
	alias dbreset='bundle exec rake db:drop && bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rake db:seed'
	alias console='bundle exec rake console'
	alias bes='bundle exec shotgun'
	alias generatemigration='bundle exec rake generate:migration'
	alias generatemodel='bundle exec rake generate:model'


_________________________________________________________________________-
