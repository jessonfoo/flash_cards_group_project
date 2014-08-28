
get '/'

end


get ':user_id/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @card = Card.find(params[:card_id])
  erb :gameplay
end

post ':user_id/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @card = Card.find(params[:card_id])
  redirect back
end