Given("An admin exists {string} {string}") do |email, password|
  @admin = FactoryGirl.create(:admin_user, email: email, password: password)
end

Given("I am logged in as admin") do
 login_as @admin, scope: :admin_user
end

When("I go to the dashboard") do
  visit admin_user_session_path
end
