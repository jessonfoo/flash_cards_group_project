enable :sessions

post '/:user_id/:deck_id/:card_no' do
  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards
  @answer = params[:answer]
  @card_no = params[:card_no].to_i
  @game_id = session[:game_id]
  @user = params[:user_id]

  if @card_no > @cards.length - 1
    session[:game_id] = nil
    session[:answer] = nil
    redirect to("/#{params[:user_id]}/#{params[:deck_id]}/game_end/#{@game_id}")
  end

  session[:answer] = @answer

  redirect to("/#{params[:user_id]}/#{@deck.id}/#{@card_no}")
end

#-----------------------------------------------------

get '/:user_id/:deck_id/:card_no' do
  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards
  @card_no = params[:card_no].to_i
  @current_card = @cards[@card_no]
  @user = params[:user_id]


  if @card_no.to_i == 0
    @game = Game.create(deck_id: @deck.id, user_id: params[:user_id])
    session[:game_id] = @game.id
  end

  game = Game.find(session[:game_id])

  if session[:answer] == @current_card.term
    game.increment(:score)
    game.save!
    p "CORRECT ANSWER"
    @card_no += 1
    session[:correct] = true
  end

  @score = game.score
  erb :gameplay
end

#----------------------------------------------------------

get '/:user_id/:deck_id/game_end/:game_id' do
  @user = User.find(params[:user_id])
  @deck = Deck.find(params[:deck_id])
  @game = Game.find(params[:game_id])
  erb :game_end
end
