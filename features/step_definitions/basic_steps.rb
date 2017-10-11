Then("I should see the text {string}") do |text|
  expect(page).to have_content text
end

Then("I should see the picture {string}") do |pic_url|
  expect(page).to have_xpath("//img[@src='#{pic_url}']")
end

Given("I click {string}") do |link|
  click_link_or_button link
end

Then("I should be on cart page") do
  @cart = Cart.last
  expect(page).to have_current_path cart_path(@cart)
end

Then("I fill in field {string} and id {string} with {string}") do |field, id, input|
  within("//div[@id='#{id}']") do
    fill_in field, with: input
  end
end
