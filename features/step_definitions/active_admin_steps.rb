Given("An admin exists {string} {string}") do |email, password|
  @admin = FactoryGirl.create(:admin_user, email: email, password: password)
end

Given("I am logged in as admin") do
 login_as @admin, scope: :admin_user
end

When("I go to the dashboard") do
  visit admin_user_session_path
end

When("I click {string} for {string} restaurant") do |link, restaurant_name|
  restaurant = Restaurant.find_by(name: restaurant_name)
  within("#restaurant_#{restaurant.id}") do
    click_link_or_button link
  end
end

Then("I click {string} for {string} restaurant category") do |link, restaurant_category_name|
  restaurant_category = RestaurantCategory.find_by(name: restaurant_category_name)
  within("#restaurant_category_#{restaurant_category.id}") do
    click_link_or_button link
  end
end

#
# When("I click ok on alert box") do
#   # page.driver.browser.switch_to.alert.accept
#   page.accept_alert 'Are you sure you want to delete this?' do
#     click_button('OK')
#   end
# end

Then("I select {string} from restaurant category dropdown") do |option|
  select option, from: "restaurant[restaurant_category_id]"
end

Then("I select {string} from dish category dropdown") do |option|
  select option, from: "dish[dish_category_id]"
end

When("I click {string} for {string} dish") do |link, dish_name|
  dish = Dish.find_by(name: dish_name)
  within("#dish_#{dish.id}") do
    click_link_or_button link
  end
end

Then("I click {string} for {string} dish category") do |link, dish_category_name|
  dish_category = DishCategory.find_by(name: dish_category_name)
  within("#dish_category_#{dish_category.id}") do
    click_link_or_button link
  end
end
#
# Then("I select {string} from dish category dropdown") do |dish_category|
#   dish_cat = DishCategory.find_by(name: dish_category)
#   within("#dish_category_#{dish_cat.id}") do
#     click_link_or_button link
#   end
# end