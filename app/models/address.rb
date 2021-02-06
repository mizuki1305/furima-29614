class Address < ApplicationRecord
  def change
    create_table :address do |t|
      t.string  :postcode
      t.integer :area_id
      t.string :city
      t.string :town
      t.string :building
      t.string :number
      t.references :purchase, foreign_key: true
    end
  end

  belongs_to :purchase
end
