class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string     :product,     null: false
      t.text       :text,        null: false
      t.integer    :category_id, null: false
      t.integer    :state_id,    null: false
      t.integer    :burden_id,   null: false
      t.integer    :area_id,     null: false
      t.integer    :day_id,      null: false
      t.integer    :price,       null: false
      t.references :user,        null: false, foreign: true
      t.timestamps
    end
  end
end
