class Api::V1::RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all.includes(:restaurant_category)
  end

  def show
    @restaurant = Restaurant.includes(:restaurant_category, :menus, :dishes, :dish_categories).find_by(id: params[:id])
  end
end
