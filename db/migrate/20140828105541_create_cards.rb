class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :term
      t.string :definition
      t.belongs_to :deck
    end
  end
end
