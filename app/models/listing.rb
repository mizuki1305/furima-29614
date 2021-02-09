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
  end

  has_one :purchase
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :area
  belongs_to :day
end