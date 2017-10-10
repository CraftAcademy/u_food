Given("I have 1 {string} in my order") do |item|
  @cart = Cart.create
  dish = Dish.find_by(name: item)
  @cart.add(dish, dish.price)
end

Then("My order should contain {string} item") do |item_count|
  expect(@cart.cart_item.count).to eq item_count
end

