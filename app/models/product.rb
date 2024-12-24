class Product < ApplicationRecord
  before_update :update_function
  
  belongs_to :user
  has_many :requests, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :amount, presence: true

  private

  def update_function
    if requests.exists?(status: "accepted")
      Rails.logger.info("hello")
      throw(:abort)
    end
  end
end
