class Restaurant < ApplicationRecord
  belongs_to :restaurant_category
  has_many :menus
  has_many :dishes, through: :menus
  has_many :dish_categories, through: :dishes
end
