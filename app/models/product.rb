class Product < ApplicationRecord
  belongs_to :user
  has_many :requests, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :amount, presence: true
  validate  :update_function,on: :update

  def update_function
    puts ".........................  ...........  ............. Its is used"
    if requests.exists?(status: "accepted")
      Rails.logger.debug "Custom validation failed: Accepted orders can't be changed"
      errors.add(:base, "Accepted orders can't be changed")
    end
  end
end
