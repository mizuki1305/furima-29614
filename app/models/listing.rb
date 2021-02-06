class Listing < ApplicationRecord
  with_options presence: true do
    validates :product
    validates :text
    validates :category_id
    validates :state_id
    validates :burden_id
    validates :area_id
    validates :day_id
    validates :price
    validates :user
  end

  has_one :purchase
  belongs_to :user
end
