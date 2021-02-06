class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/ }
    validates :family_name_ruby, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :first_name_ruby, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :birthday
  end

  has_many :Listings
  has_many :purchases
end