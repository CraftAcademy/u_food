Given("I have 1 {string} in my order") do |item|
  cart = FactoryGirl.create(:cart)
  dish = Dish.find_by(name: item)
  cart.add(dish, dish.price)
end

Then("My order should contain {string} item") do |item_count|
  cart = Cart.last
  expect(cart.total_unique_items).to eq item_count.to_i
end

