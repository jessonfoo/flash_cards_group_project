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

get '/:id/newdeck' do
  @user = User.find(params[:id])
  erb :new_deck_layout
end

post '/:id/newdeck' do
  @user = User.find(params[:id])
  @deck = Deck.create(deck_name: params[:deck_name])
  @deck_id = @deck.id
  erb :new_deck_layout
end

get '/:id/:deck_id/newcard' do
  @user = User.find(params[:id])
  @deck = Deck.find(params[:deck_id])
  @deck_id = @deck.id
  @cards = @deck.cards
  erb :new_deck_layout
end

post '/:id/:deck_id/newcard' do
  @user = User.find(params[:id])
  @deck = Deck.find(params[:deck_id])
  @card = Card.create(term: params[:term], definition: params[:definition])
  @deck.cards << @card
  redirect "/#{@user.id}/#{params[:deck_id]}/newcard"
end
