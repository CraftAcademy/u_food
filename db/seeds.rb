# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password', admin: true)
AdminUser.create!(email: 'restaurant_owner@example.com', password: 'password', password_confirmation: 'password')

['Thai', 'Italian', 'Traditional Nordic'].each do |restaurant_category|
  RestaurantCategory.create([{
                                 name: restaurant_category,
                                 description: Faker::FamilyGuy.quote
                             }])

  2.times do
    Restaurant.create({name: Faker::StarWars.character,
                       address: Faker::Address.street_address,
                       description: Faker::HitchhikersGuideToTheGalaxy.quote,
                       restaurant_category: RestaurantCategory.find_by(name: restaurant_category)
                      })
  end
end

Restaurant.all.each do |restaurant|
  ['Lunch', 'Evening Menu'].each do |menu|
    Menu.create(name: menu, restaurant: restaurant)
  end

  ['Starter', 'Main', 'Dessert'].each do |category|
    DishCategory.find_or_create_by(name: category)
    5.times do
      dish = Dish.create(name: Faker::Food.dish,
                         description: Faker::Hobbit.quote,
                         price: Faker::Number.between(5, 25),
                         pic_url: Faker::LoremPixel.image('200x200', false, 'food'),
                         dish_category: DishCategory.find_by(name: category)
      )
      MenuLine.create(menu: restaurant.menus.first, dish: dish)
    end
  end
end




2.times do
  User.create(email: Faker::Simpsons.character,
              password: Faker::FamilyGuy.quote
  )
end


