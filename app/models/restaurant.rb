class Restaurant < ApplicationRecord
  belongs_to :restaurant_category
  has_many :menus, dependent: :destroy
  has_many :dishes, through: :menus
  has_many :dish_categories, through: :dishes

  geocoded_by :address

  validates :address, presence: true
  after_validation :geocode

  def self.for_markers
    all.to_a.map(&:serializable_hash).map do |restaurant|
      {name: restaurant['name'],
       latitude: restaurant['latitude'],
       longitude: restaurant['longitude']}
    end
  end

end
