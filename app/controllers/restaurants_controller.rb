class RestaurantsController < ApplicationController
  def index
    @categories = RestaurantCategory.all
    @restaurants = Restaurant.all
  end

  def show
    @dishes = Dish.all
  end
end
