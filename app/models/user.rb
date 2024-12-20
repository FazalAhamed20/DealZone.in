class User < ApplicationRecord
  has_many :products
  has_many :requests
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
