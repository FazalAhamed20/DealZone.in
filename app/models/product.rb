class Product < ApplicationRecord
  belongs_to :user
  has_many :requests, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :amount, presence: true
  validate :update_function  


  def update_function
    if requests.exists?(status: "accepted")
      errors.add(:base, "Accepted orders can't be changed")
    end
  end
end
