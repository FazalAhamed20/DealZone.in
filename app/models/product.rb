class Product < ApplicationRecord
  belongs_to :user
  has_many :requests
  validates :name, presence: true
  validates :description, presence: true
  validates :amount, presence: true
end
