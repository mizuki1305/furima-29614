class Purchase < ApplicationRecord
  def change
    create_table :purchases do |t|
      t.references  :user,   foreign_key: true
      t.references  :listing foreign_key: true
    end
  
  belongs_to :listing
  belongs_to :user
  has_one    :address
end
