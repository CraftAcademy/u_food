Then('I should be on cart page') do
  cart_path(Cart.ids, Restaurant.ids)
end

When(/^I fill in my card details on the stripe form$/) do
  sleep(5)
  @stripe_iframe = all('iframe[name=stripe_checkout_app]').last
  within_frame @stripe_iframe do
    fill_in 'Email', with: 'random@morerandom.com'
    fill_in 'Card number', with: '4242 4242 4242 4242'
    fill_in 'CVC', with: '123'
    fill_in 'cc-exp', with: '12/2021'
  end
end

When(/^I submit the stripe form$/) do
  within_frame @stripe_iframe do
    page.execute_script("$('button').click();")
  end
  sleep(5)
end

Given(/^I click Pay with Card stripe button$/) do
  sleep(0.2)
  find('.stripe-button-el').trigger('click')
end

And(/^I click "([^"]*)" category$/) do |link_text|
  find('a', text: link_text).trigger('click')
  sleep(0.2)
end

And(/^"([^"]*)" "([^"]*)" is added to my cart$/) do |count, dish_name|
  dish = Dish.find_by(name: dish_name)
  @cart = @cart || @user.carts.create
  @cart.add(dish, count.to_i)
  page.set_rack_session(cart_id: @cart.id)
end

Then(/^I should be on the payment confirmation page$/) do
  expect(current_path).to eq cart_path(@cart)
end