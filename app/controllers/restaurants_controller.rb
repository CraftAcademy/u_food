class RestaurantsController < ApplicationController
  before_action :find_cart

  def index
    @categories = RestaurantCategory.all
    @restaurants = get_restaurants_collection
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

  private
  def get_restaurants_collection
    Restaurant.all.to_a.map(&:serializable_hash).map do |restaurant|
      {name: restaurant['name'],
       lattitude: restaurant['latitude'],
       longitude: restaurant['longitude']}
    end
  end
end