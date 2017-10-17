class RestaurantsController < ApplicationController
  before_action :find_cart, :get_user_location
  LOCALHOST_IP = '127.0.0.1'
  DEFAULT_IP_LOCATION_STHLM = '130.237.186.207'

  def index
    respond_to do |format|
      format.html do
        @categories = RestaurantCategory.all
      end
      format.json do
        @restaurants = Restaurant.near(@user_location, 3, units: :km).for_markers
        render json: {restaurants: @restaurants}
      end
    end
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

  def get_user_location
    if params['lat'] && params['lng']
      @user_location = [params['lat'], params['lng']]
    elsif request.remote_ip == LOCALHOST_IP
      @user_location = Geocoder.coordinates(DEFAULT_IP_LOCATION_STHLM)
    else
      @user_location = request.location.coordinates
    end
  end
end