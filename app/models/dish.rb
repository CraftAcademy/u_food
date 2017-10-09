class Dish < ApplicationRecord

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :pic_url, presence: true
  validates :restaurant, presence: true
  validates :category, presence: true
end
