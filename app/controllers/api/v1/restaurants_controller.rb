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
    @cart = Cart.create(user: current_api_v1_user)
    if params[:order][:dishes].present?
      @items = params[:order][:dishes]
      @items.each do |item|
        if an_integer?(item)
          dish = Dish.find_by(id: item.to_i)
          @cart.add(dish, dish.price)
        end
      end
    end
  end

  def an_integer?(item)
    if /(\D+)/.match(item).nil?
      return true
    else
      render json: {message: 'wrong data received'}
      return false
    end
  end
end
