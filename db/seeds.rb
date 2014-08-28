require 'faker'

5.times do
  Deck.create(deck_name: Faker::Lorem.word)
end

Deck.all.each do |deck|
  20.times do
    deck.cards << Card.create(term: Faker::Lorem.word, definition: Faker::Lorem.sentence)
  end
end
