enable :sessions

post '/:user_id/:deck_id/:card_no' do
  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards

  # if params[:card_no].to_i == @cards.length - 1
  #   redirect "/#{@deck.user_id}"
  # end

  @answer = params[:answer]
  @card_no = params[:card_no].to_i

  redirect to("/#{params[:user_id]}/#{@deck.id}/#{@card_no}")
end


#set route from deck (from index.erb) to have card_no 0


get '/:user_id/:deck_id/:card_no' do
  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards
  @card_no = params[:card_no].to_i


  @current_card = @cards.at(@card_no)
  if Deck.compare_answer(@answer, @current_card)
    @correct = true
    @card_no += 1

  else
    @correct = false
    @card_no += 1
  end

  if @card_no == @cards.length - 1
    puts "YOU SUCK "
    @correct = false
  end

  erb :gameplay
end
