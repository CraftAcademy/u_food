Given('the following dishes exists') do |table|
  table.hashes.each do |hash|
    category = find_or_create_dish_category(hash)
    menu = Menu.find_by(name: hash[:menu_name])
    hash.except!('dish_category', 'menu_name')
    dish = FactoryGirl.create(:dish, hash.merge(dish_category: category))
    FactoryGirl.create(:menu_line, menu: menu, dish: dish)
  end
end

Given('the following dish category exists') do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:dish_category, hash)
  end
end

Given('the following restaurants with associations exist') do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:restaurant_with_associations, hash)
  end
end

And(/^show me the page$/) do
  save_and_open_page
end
