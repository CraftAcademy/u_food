Given('the following restaurant category exists') do |table|
  table.hashes.each do |hash|
    FactoryGirl.create(:restaurant_category, hash)
  end
end
