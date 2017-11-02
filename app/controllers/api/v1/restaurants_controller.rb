class Api::V1::RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all.includes(:restaurant_category)
  end

  def show
    @restaurant = Restaurant.includes(:restaurant_category, :menus, :dishes, :dish_categories).find_by(id: params[:id])
  end

  def create
    cart = Cart.create
    items = params[:restaurants][:data][:dish]
    items.each do |item|
      item = Dish.find_by(id: items[0].to_i)
      cart.add(item, item.price)
    end
  end
end
