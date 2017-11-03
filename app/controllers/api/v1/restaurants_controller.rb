class Api::V1::RestaurantsController < ApiController
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :authenticate_api_v1_user!, only: :create

  def index
    @restaurants = Restaurant.all.includes(:restaurant_category)
  end

  def show
    @restaurant = Restaurant.includes(:restaurant_category, :menus, :dishes, :dish_categories).find_by(id: params[:id])
  end

  def create
    if !current_api_v1_user.nil?
      @cart = Cart.create(user: current_api_v1_user)
      params_allowed
      @items.each do |item|
        dish = Dish.find_by(id: item.to_i)
        @cart.add(dish, dish.price)
      end
    end
  end

  def params_allowed

    @items = params[:order][:dishes]
  end
end
