class CreateGames < ActiveRecord::Migration
  def change
  	create_table :games do |t|
		t.belongs_to :user
		t.belongs_to :deck
    t.integer :score, default: 0
		t.timestamps
	end
  end
end
