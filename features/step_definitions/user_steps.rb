Given(/^I fill in "([^"]*)" with "([^"]*)"$/) do |item, content|
  fill_in item, with: content
end

Given("the following user exists") do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:user, hash)
  end
end

Given("the following user is signed in") do |table|
  table.hashes.each do |hash|
    @user = User.find_by(email: hash[:email])
    login_as(@user, scope: :user)
  end
end

Given("the user is signed out") do
  logout
end

Given("I should see link {string}") do |string|
  expect(page).to have_link string
end

Given("I should not see link {string}") do |string|
  expect(page).not_to have_link string
end

Given("I see the navbar") do
  expect(page).to have_css('nav.navbar')
end

Then("I click {string} button") do |button|
  click_button button
end
