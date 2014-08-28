require 'faker'

5.times do
  Deck.create(deck_name: Faker::Lorem.word)
end

Deck.all.each do |deck|
  20.times do
    deck.cards << Card.create(term: Faker::Lorem.word, definition: Faker::Lorem.sentence)
  end
end


user = User.create(username: Faker::Internet.user_name, password: Faker::Lorem.characters(6))
user.update_attribute(:decks, Deck.all)