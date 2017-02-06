# Useful Things:

*  [Sublime Snippets](readmes/sublime-snippets.md)
*  [Aliases](readmes/aliases.md)
*  [Sinatra User Login](readmes/user-login.md)
 *  [Model](readmes/user-model.md)
 *  [Controller](readmes/user-controller.md)
 *  [Views](readmes/user-views.md)

__________________________________________________________________

## Useful-Snippets ##
__Installing Sublime Snippets:__

Copy snippets with .sublime-snippet file extensions to your sublime snippet folder.
You can access this folder with

	Preferences -> Browse Packages -> User

__________________________________________________________________
#### Sinatra Migration Snippets ####

__create migration table__

create_table-*tab*
	
```ruby
	create_table :${1:plural} do |t|
		t.${2:string} :${3:column}${4:, {null: false\}}
		t.${5:string} :${6:column}${7:, {null: false\}}
		${11:t.${8:string} :${9:column}, ${10:{null: false\}}}
		${15:t.${12:string} :${13:column}, ${14:{null: false\}}}
		t.timestamps
	end
```
	
__________________________________________________________________
#### ERB snippets ####
__html form for post request__

formpost-*tab*
	
```html
	<form action="$1" method="post">
		<input type="${2:text}:" name="$3">
		<input type="${4:text}:" name="$5">
		${8:<input type="${6:text}:" name="$7">}
		${11:<input type="${9:text}:" name="$10">}
		<input type="submit" value="${12:submit}">
	</form>
```

__html form for delete request__

formdelete-*tab*
	
```html
	<form action="$1" method="post">
		<input type="hidden" name="_method" value="delete">
		${4:<input type="${2:text}" name="$3">}
		<input type="submit" value="${5:submit}">
 	</form>
```
	
__html form for put request__

formput-*tab*
	
```html
	<form action="$1" method="post">
		<input type="hidden" name="_method" value="put">
		<input type="${2:text}:" name="$3">
		<input type="submit" value="${4:submit}">
	</form>
```

__html embedded ruby__

er-*tab*
	
```html
	<% $0 %>
```
__html display embedded ruby__

pe-*tab*
	
```html
	<%= $0 %>
```
	
__end ruby interpolation__

end-*tab*
	
```html
	<% end %>
```
	

__________________________________________________________________
#### Sinatra Controller Snippets 

__GET HTTP REQUEST__

get-*tab*
	
```ruby
	get '/$1' do
  		$2
	end
```

__GET HTTP Request for Index__

getindex-*tab*
	
```ruby
	get '/${1:entries}' do
  		$3
		erb :'${1:entries}/${2:index}'
	end
```
	
__GET HTTP Request for Show__

getshow-*tab*
	
```ruby
	get '/${1:entries}/${2:entry}_id' do
		$4
		erb :'${1:entries}/${3:show}'
	end
```
	
__GET HTTP Request for Show *Embedded*__

getshow2-*tab*
	
```ruby
	get '/${1:entries}/${2:entry}_id/${3:articles}/${4:article}_id' do
  		$6
		erb :'${3:articles}/${5:show}'
	end
```

__PUT HTTP Request__

put-*tab*

```ruby
	put '/${1:entries}/${2:entry}_id' do 
  		$3
	end
```
__Post HTTP Request__

post-*tab*
	
```ruby
	post '/${1:entries}' do 
		$2
	end
```

__Delete HTTP Request__

delete-*tab*
	
```ruby
	delete '/' do
	  $1
	 end
```
__Good Looking Display Puts for Server Info__

tput-*tab*
	
```ruby
	############################
	 puts "*" * `tput cols`.chomp.to_i
	 puts ""
	 puts ""
	 puts "-" * (((`tput cols`.chomp.to_i)/2)-10) + "LOOK OVER HERE" + "-" * (((`tput cols`.chomp.to_i)/2)-10)
	 puts ""
	 p $1
	 ${3:p $2}
	 puts ""
	 puts "-" * `tput cols`.chomp.to_i
	 puts ""
	 puts ""
	 puts "*" * `tput cols`.chomp.to_i
	 ############################
```




__________________________________________________________________
# Useful Aliases #

__easy access to bash profile__

	alias profile='subl ~/.bashrc'

__shorthand commands for applications__

	alias sbl='subl .'
	alias chrome='google-chrome-stable'
	alias chrome!='google-chrome-stable & exit'
	chromeo (){
		google-chrome-stable www."$1".com
	}
	phase2! (){
		google-chrome-stable https://github.com/chi-squirrels-2017/phase-2-guide & exit
	}

	phase2 (){
		google-chrome-stable https://github.com/chi-squirrels-2017/phase-2-guide
	}
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
	mkcdir ()
	{
	    mkdir -p -- "$1" &&
	      cd -P -- "$1"
	}

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
# Sinatra User Login #

## Model ##

__Migration for user table__ 

```ruby
class Users < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, { null: false }
      t.string :email, { null: false }
      t.string :hashed_password, { null: false }

      t.timestamps(null: false)
    end
  end
end
```

__Model for user table__

```ruby
class User < ActiveRecord::Base

  validates :email, { presence: true }
  validates :email, { uniqueness: true }
  validates :email, format: { with: /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/ }
  validate :check_password

  def check_password
    if @raw_password && @raw_password.length < 8
      @errors.add(:password, "needs to be 8 characters or more")
    end
  end

  def self.authenticate(user_hash)
    user = User.find_by(email: user_hash[:email])
    return user if user && user.password == user_hash[:password]
  end

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @raw_password = new_password
    @password = BCrypt::Password.create(@raw_password)
    self.hashed_password = password
  end

end
```

## Controller ##

__Controller for users__

```ruby
#form for creating new user
get '/users/new' do
  erb :'users/new'
end

#post for submit on registration form
post '/users' do
  user = User.new(params[:user])

  if user.save
    set_user(user)
    redirect '/'
  else
    @errors = user.errors.full_messages
    erb :'users/new'
  end

end
```

__Controller for sessions__

```ruby
# login page
get '/sessions/new' do
  erb :"users/login"
end

post '/sessions' do
  user = User.find_by(email: params[:email])
    if user && user.authenticate?(params[:password])
      set_user(user)
      redirect "/"
    else
      @errors = ["Invalid username or password"]
      erb :"users/login"
    end

end

# log user out by ending session! turn session to nil
delete '/sessions' do
  session[:user_id] = nil
  redirect '/'
end
```

__Session helpers__

```ruby
def logged_in?
  current_user != nil
end

def current_user
   @_current ||= User.find_by(id: session[:user_id])
end

def set_user(user)
  session[:user_id] = user.id
end
```

## Views ##

__New user form__

```html
<container class='registration'>

  <%= erb :'_error' %>

  <form class="new-user-form" method="post" action="/users">
    <label>Username:</label><br>
    <input id="first-name" type="text" name="user[username]" /><br>
    <label>Email:</label><br>
    <input id="email" type="email" name="user[email]" /><br>
    <label>Password:</label><br>
    <input id="password" type="password" name="user[password]" /><br>
    <input type="submit" value="submit"/>
  </form>
  
</container>
```

__New session form__

```html
<container class='login'>

  <%= erb :'_error' %>

  <form class="login-form" method="post" action="/sessions">
    <label>Email or Username:</label><br>
    <input id="email" type="email" name="email" /><br>
    <label>Password:</label><br>
    <input id="password" type="password" name="password" /><br>
    <input type="submit" value="submit"/>
  </form>
</container>
```

__Nav for layout__

```html
<header>
  <nav class="nav-bar">
    <% if current_user %>
      <a href="/">home</a>
      <form class="button-link" method="post" action="/sessions">
          <input type="hidden" name="_method" value="delete">
          <button id="logout-button" type="submit">Logout</button>
      </form>
    <% else %>
      <a href="/sessions/new">login</a>
      <a href="/users/new">register</a>
    <% end %>
  </nav>
</header>
```


__Error views__

```html
<% if @errors %>
  <% @errors.each do |error| %>
    <span class="error"><%= error %></span>
  <% end %>
<% end %>
```
