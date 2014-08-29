class AddScore < ActiveRecord::Migration
  def change
    add_column :games, :score, :integer, default: 0
  end
end
