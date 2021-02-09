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
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :state_id
  belongs_to :burden_id
  belongs_to :area_id
  belongs_to :day_id
end