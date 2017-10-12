class Restaurant < ApplicationRecord
  belongs_to :restaurant_category
  has_many :dishes
end
