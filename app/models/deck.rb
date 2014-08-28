class Deck < ActiveRecord::Base
  has_many :cards

  def current_card
    current_card = self.cards.last
  end

  def next_card
    self.cards.pop 
  end

end
