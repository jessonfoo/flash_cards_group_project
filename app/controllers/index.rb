
get '/' do

end



get '/:user_id/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @answer = params[:answer]

  index = 0
  while 

  #Game.find_by(:user_id, params[:user_id])
  erb :gameplay
end

post '/:user_id/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  redirect back
end