class RestaurantsController < ApplicationController
  before_action :find_cart, :get_user_location

  def get_user_location
    if request.location
      @user_location = request.location
    else
      @user_location = 'Stockholm Sweden'
    end
  end

  def index
    @categories = RestaurantCategory.all
    @restaurants = Restaurant.for_markers
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @menus = @restaurant.menus
    @dish_categories = @restaurant.dish_categories.uniq
    if params[:dish_category_id].present?
      @current_dish_category = DishCategory.find(params[:dish_category_id])
      @current_category_dishes = @current_dish_category.dishes.select do |obj|
        obj.menu_lines.detect do |line|
          line.menu.restaurant == @restaurant
        end
      end

    end
  end
end