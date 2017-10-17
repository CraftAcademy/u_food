FactoryGirl.define do
  factory :admin_user do
    email 'admin_features@test.com'
    password  'password'
    super_admin 'true'
  end
end
