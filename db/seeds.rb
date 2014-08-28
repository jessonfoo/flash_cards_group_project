require 'faker'

5.times do
  Deck.create(deck_name: Faker::Lorem.word)
end

Deck.all.each do |deck|
  20.times do
    deck.cards << Card.create(term: Faker::Lorem.word, definition: Faker::Lorem.sentence)
  end
end

10.times do
	user = User.create(username: Faker::Internet.user_name, password: Faker::Lorem.characters(6))
	user.games << (Game.create(deck_id: rand(1..3)))
end
