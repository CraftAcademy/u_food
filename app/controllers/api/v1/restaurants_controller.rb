class Api::V1::RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all.includes(:restaurant_category)
  end

  def show
    # @restaurant = Restaurant.find(params[:id])
    # binding.pry
    @restaurant = Restaurant.where(id: params[:id]).includes(:restaurant_category, :menus, :dishes, :dish_categories)
    @restaurant = @restaurant[0]
  end
end
