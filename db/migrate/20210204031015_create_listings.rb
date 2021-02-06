class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :product
      t.text :text
      t.integer :category_id
      t.integer :state_id
      t.integer :burden_id
      t.integer :area_id
      t.integer :day_id
      t.integer :price
      t.references :user
      t.timestamps
    end
  end
end
