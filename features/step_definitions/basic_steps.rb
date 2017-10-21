Then("I should see the text {string}") do |text|
  expect(page).to have_content text
end

Then("I should not see the text {string}") do |text|
  expect(page).to have_no_content text
end

Then("I should see the picture {string}") do |pic_url|
  expect(page).to have_xpath("//img[@src='#{pic_url}']")
end

Given("I click {string}") do |link|
  click_link_or_button link
end

Then("I fill in field {string} and id {string} with {string}") do |field, object, input|
  dish = Dish.find_by(name: object)
  within("#dish-#{dish.id}") do
    fill_in field, with: input
  end
end

Then("I click {string} within id {string}") do |input, object|
  dish = Dish.find_by(name: object)
  within("#dish-#{dish.id}") do
    click_link_or_button input
  end
end

Then("I should not see {string}") do |message|
  expect(page).to have_no_content message
end


And(/^show me the page$/) do
  save_and_open_page
end

And(/^show me an image of the page$/) do
  save_and_open_screenshot
end


And(/^I click "([^"]*)" in navbar$/) do |link_text|
  within '#cart-link' do
    find('a', text:link_text).trigger('click')
  end
  sleep 2
  #binding.pry
end