Rails.application.routes.draw do
  root controller: :restaurants, action: :index
  resources :restaurants
  resources :carts
  get '/add_to_cart/:id', controller: :carts, action: :add, as: :add_to_cart
end
