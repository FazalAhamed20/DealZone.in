class Product < ApplicationRecord
  before_update :update_function
  
  belongs_to :user
  has_many :requests, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :amount, presence: true

  def update_function
    puts "hello"
  end
end
