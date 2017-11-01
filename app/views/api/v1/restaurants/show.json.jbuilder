json.dishes @dishes do |dish|
  json.id dish.id
  json.name dish.name
  json.description dish.description
  json.price dish.price
  json.image dish.image
  json.dish_category dish.dish_category.name
  json.restaurant dish.restaurant.name
  json.restaurant_category dish.restaurant.restaurant_category.name
  json.menu dish.menus do |menu|
    json.name menu.name
  end
end
