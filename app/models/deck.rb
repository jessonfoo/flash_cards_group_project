class Deck < ActiveRecord::Base
  has_many :cards
  has_many :games
  has_many :users, through: :games

  def get_card(index)
    self.cards.at(index)
  end

   def self.compare_answer(answer, card_id)
    card = Card.find(card_id)
    return true if answer.to_s == card.term.to_s
  end
end
