get '/' do
  @user_id = params[:user_input]
  erb :home_page
end

post '/user' do
  @user_id = params[:user_input]
  redirect "/user/#{@user_id}"
end

get '/user/:id' do
  erb :user_layout
end

post '/create' do
  User.create(username: params[:username], password: params[:user_password])
  redirect "/user/#{@username}"
end
