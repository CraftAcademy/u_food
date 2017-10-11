# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if DishCategory.count == 0
  puts "Seeding section data..."
  %w(Starter Main Dessert).each do |name|
    DishCategory.create!(name: name)
  end
else
  puts "You already have some Dish Category data"
end

3.times do
  RestaurantCategory.create([{
      name: Faker::Simpsons.character,
      description: Faker::FamilyGuy.quote
      }])

  2.times do
      Restaurant.create([{
          name: Faker::StarWars.character,
          address: Faker::Address.street_address,
          description: Faker::HitchhikersGuideToTheGalaxy.quote
                          }])
      rest = Restaurant.last
      res_cat = RestaurantCategory.last
      rest.update_attribute(:restaurant_category, res_cat)
    end
end


DishCategory.create([{
    name: "Starter"
}])
DishCategory.create([{
    name: "Main"
}])
DishCategory.create([{
    name: "Dessert"
}])

5.times do
  Dish.create([{
      name: Faker::Food.dish,
      description: Faker::Hobbit.quote,
      price: Faker::Number.between(5, 25),
      pic_url: Faker::LoremPixel.image("200x200", false, 'food')
      }])
  dish = Dish.last
  dish_cat = DishCategory.find_by(name: "Starter")
  dish.update_attribute(:dish_category, dish_cat)
end

5.times do
  Dish.create([{
                   name: Faker::Food.dish,
                   description: Faker::HarryPotter.quote,
                   price: Faker::Number.between(20, 60),
                   pic_url: Faker::Placeholdit.image("50x50", 'jpg')
               }])
  dish = Dish.last
  dish_cat = DishCategory.find_by(name: "Main")
  dish.update_attribute(:dish_category, dish_cat)
end

5.times do
  Dish.create([{
                   name: Faker::Dessert.variety,
                   description: Faker::Coffee.notes,
                   price: Faker::Number.between(5, 60),
                   pic_url: Faker::LoremPixel.image("200x200", false, 'food')
               }])
  dish = Dish.last
  dish_cat = DishCategory.find_by(name: "Dessert")
  dish.update_attribute(:dish_category, dish_cat)
end
