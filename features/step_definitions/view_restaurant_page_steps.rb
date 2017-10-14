Given("the following restaurants exist") do |table|
  table.hashes.each do |hash|
    res_category = RestaurantCategory.find_by(name: hash[:restaurant_category])
    hash.delete_if { |key, value| value == res_category.name }
    restaurant = FactoryGirl.create(:restaurant, hash)
    restaurant.update_attribute(:restaurant_category, res_category)
  end
end
