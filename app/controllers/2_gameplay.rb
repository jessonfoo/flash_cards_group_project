enable :sessions

post '/:user_id/:deck_id/:card_no' do
  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards
  @answer = params[:answer]
  @card_no = params[:card_no].to_i

  if @card_no > @cards.length - 1
    session[:game_id] = nil
    redirect to("/#{params[:user_id]}")
  end

  puts "SESSION SCORE: #{@score}"

  redirect to("/#{params[:user_id]}/#{@deck.id}/#{@card_no}")
end

#set route from deck (from index.erb) to have card_no 0


get '/:user_id/:deck_id/:card_no' do
  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards
  @card_no = params[:card_no].to_i
  @answer = params[:answer]

  if @card_no.to_i == 0
    @game = Game.create(deck_id: @deck.id, user_id: params[:user_id], score: 0)
    session[:game_id] = @game.id
  end

  @current_card = @cards[@card_no]

  if @answer == @current_card.term
    Game.find(session[:game_id]).increment(:score)
    p "CORRECT ANSWER"
    Game.save
    @card_no += 1

  else
    @card_no += 0
  end

  @score = Game.find(session[:game_id]).score
  erb :gameplay
end
