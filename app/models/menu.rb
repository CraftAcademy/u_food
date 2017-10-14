class Menu < ApplicationRecord
  has_many :menu_lines
  has_many :dishes, through: :menu_lines
  belongs_to :restaurant
  validates :name, presence: true
end
