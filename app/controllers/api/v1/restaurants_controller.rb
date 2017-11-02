class Api::V1::RestaurantsController < ApiController
  include DeviseTokenAuth::Concerns::SetUserByToken

  def index
    @restaurants = Restaurant.all.includes(:restaurant_category)
  end

  def show
    @restaurant = Restaurant.includes(:restaurant_category, :menus, :dishes, :dish_categories).find_by(id: params[:id])
  end
end
