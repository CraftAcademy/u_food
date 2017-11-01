class Api::V1::RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all.includes(:restaurant_category)
  end

  def show
    restaurant = Restaurant.find(params[:id])
    @dishes = Dish.select{|dish| dish.restaurant_id == restaurant.id}
  end
end
