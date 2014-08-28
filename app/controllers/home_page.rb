get '/' do
  erb :home_page
end

post '/:user' do
  @user_name = params[:username]
  redirect "/#{@user_name}"
end

get '/:user' do
  erb :user_layout
end
