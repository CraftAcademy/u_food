Given("the following dishes exists") do |table|
  table.hashes.each do |hash|
    category = DishCategory.find_by(name: hash[:dish_category])
    hash.delete_if {|key, value| value == category.name}
    dish = FactoryGirl.create(:dish, hash)
    dish.update(dish_category_id: category.id)
  end
end

Given("the following dish category exists") do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:dish_category, hash)
  end
end

And(/^show me the page$/) do
  save_and_open_page
end