class Deck < ActiveRecord::Base
  has_many :cards



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
