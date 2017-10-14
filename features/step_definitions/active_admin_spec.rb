Given("the following admin user exists") do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:admin_user, hash)
  end
end

When("I go to the dashboard") do
  visit admin_user_session_path
end
