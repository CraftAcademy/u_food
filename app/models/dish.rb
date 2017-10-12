class Dish < ApplicationRecord
  belongs_to :dish_category
  belongs_to :restaurant
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :pic_url, presence: true
end
