class User < ApplicationRecord
  acts_as_token_authenticatable
  has_many :restaurants
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :email, presence: true, email: true
  validates :name, presence: true, uniqueness: true
end
