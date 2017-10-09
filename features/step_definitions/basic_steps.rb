Then("I should see the text {string}") do |text|
  expect(page).to have_content text
end

Then("I should see the picture {string}") do |pic_url|
  expect(page).to have_xpath("//img[@src='#{pic_url}']")
end

Given("I click {string}") do |link|
  click_link_or_button link
end

Then("I visit cart page") do
  @cart = Cart.last
  visit cart_path(@cart)
end
