get '/' do
  if signed_in?
    @signed_in = true
    @user = signed_in?
  else
    @signed_in = false
    @invalid_status = invalid?
  end
  erb :home_page
end

post '/username' do
  user = User.find_by(username: params[:username])
  if user.password == params[:password]
    session[:user_id] = user.id
    redirect "/#{user.id}"
  else
    session[:invalid] = true
    redirect '/'
  end
end

post '/create_account' do
  user = User.create(params)
  session[:user_id] = user.id
  redirect "/#{user.id}"
end

get '/:id' do
  @user = User.find(params[:id])
  erb :index
end

post '/signout' do
  session[:user_id] = nil
  session[:invalid] = false
  redirect '/'
end
