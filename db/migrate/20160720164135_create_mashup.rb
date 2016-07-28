class CreateMashup < ActiveRecord::Migration
  def change
    create_table :mashups do |t|
      t.string :title
      t.string :image_1
      t.string :image_2
      t.string :option_1
      t.string :option_2
      t.integer :votes_1, default: 0
      t.integer :votes_2, default: 0
      t.string :category
      t.belongs_to :user
      t.timestamps
    end
  end
end
