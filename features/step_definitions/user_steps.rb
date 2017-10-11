Given(/^I fill in "([^"]*)" with "([^"]*)"$/) do |item, content|
  fill_in item, with: content
end

Given("the following user exists") do |table|
  table.hashes.each do
    FactoryGirl.create(:user, password: 'password')
  end
end

Given("I should see link {string}") do |string|
  expect(page).to have_link string
end

Given("I should not see link {string}") do |string|
  expect(page).not_to have_link string
end