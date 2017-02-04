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
