def find_or_create_dish_category(hash)
  DishCategory.find_by(name: hash[:dish_category]) || FactoryGirl.create(:dish_category, name: hash[:dish_category])
end