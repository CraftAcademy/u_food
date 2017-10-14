Given("An admin exists {string} {string}") do |email, password|
  @admin = FactoryGirl.create(:admin_user, email: email, password: password)
end

Given("I am logged in as admin") do
 login_as @admin, scope: :admin_user
end

When("I go to the dashboard") do
  visit admin_user_session_path
end

When("I click {string} for {string}") do |link, restaurant_name|
  restaurant = Restaurant.find_by(name: restaurant_name)
  within("#restaurant_#{restaurant.id}") do
    click_link_or_button link
  end
end

When("I click ok on alert box") do
  # page.driver.browser.switch_to.alert.accept
  binding.pry
  page.accept_alert 'Are you sure you want to delete this?' do
    click_button('OK')
  end
end

