class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :deck_name
    end
  end
end
