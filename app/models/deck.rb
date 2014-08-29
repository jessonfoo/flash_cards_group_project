class Deck < ActiveRecord::Base
  has_many :cards
  has_many :games
  has_many :users, through: :games

  def get_card(index)
    self.cards.at(index)
  end

   def self.compare_answer(answer, card)
    if answer == card.term
      true
    else
      false
    end
  end
end
