Given("the following restaurants exist") do |table|
  table.hashes.each do |hash|
    res_category = RestaurantCategory.find_by(name: hash[:restaurant_category])
    res_menu = []
    res_menu << Menu.find_by(name: hash[:menu])
    hash.delete_if {|key, value| value == res_category.name }
    hash.delete_if {|key, value| value == res_menu.first.name }
    restaurant = FactoryGirl.create(:restaurant, hash)
    restaurant.update_attribute(:restaurant_category, res_category)
    restaurant.update_attribute(:menus, res_menu)
  end
end

Given("the following menu exist") do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:menu, hash)
  end
end
