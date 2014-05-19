class CreateEntrees < ActiveRecord::Migration
  def change
    create_table :entrees do |t|
      t.string :food_item
      t.text :description
      t.string :image_url
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
