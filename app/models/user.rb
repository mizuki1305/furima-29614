class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :listings
  has_many :purchases

  with_options presence: true do
    validates :nickname
    # validates :email, format: { with: /\A[a-zA-Z0-9]+\z/}
    # validates :password_confirmation, format: { greater_than_or_equal_to: 6 }
    validates :family_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥々]/}
    validates :family_name_ruby, format: { with: /\A[ァ-ヶー－]+\z/}
    validates :first_name_ruby, format: { with: /\A[ァ-ヶー－]+\z/}
  end
end