class Listing < ApplicationRecord
  with_options presence: true do
    validates :product
    validates :text
    validates :category_id, numericality: {other_than: 1}
    validates :state_id, numericality: {other_than: 1}
    validates :burden_id, numericality: {other_than: 1}
    validates :area_id, numericality: {other_than: 1}
    validates :day_id, numericality: {other_than: 1}
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
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