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
