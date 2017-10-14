class Restaurant < ApplicationRecord
  belongs_to :restaurant_category
  validates :address, presence: true
  geocoded_by :address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  has_many :menus, dependent: :destroy
  has_many :dishes, through: :menus
  has_many :dish_categories, through: :dishes

  def self.for_markers
    all.to_a.map(&:serializable_hash).map do |restaurant|
      {name: restaurant['name'],
       lattitude: restaurant['latitude'],
       longitude: restaurant['longitude']}
    end
  end
end
