class TestProduct < ApplicationRecord
  belongs_to :user
  validates :product_name, :description, :price, presence: true
  validates :price, numericality: { only_integer: true }
end
