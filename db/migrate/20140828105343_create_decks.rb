class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |t|
      t.string :deck_name
      t.belongs_to :user
      t.timestamps
    end
  end
end
