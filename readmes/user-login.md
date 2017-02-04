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

	def authenticated?(password)
    self.password == password
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

--New user form__

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
