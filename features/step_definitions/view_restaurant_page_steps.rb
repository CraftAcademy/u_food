Given("the following restaurants exist") do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:restaurant, hash)
  end
end

Given("I click {string}") do |link|
  click_link_or_button link
end
