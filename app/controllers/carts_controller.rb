class CartsController < ApplicationController

  before_action :find_cart

  def add
    dish = Dish.find(params[:id])
    if /(\D+)/.match(params[:amount]).nil?
      @cart.add(dish, dish.price, params[:amount].to_i)
      flash[:notice] = "#{dish.name} added to cart: #{params[:amount]}"
    else
      flash[:notice] = "Please enter a number"
    end
    redirect_back(fallback_location: (request.referer || restaurant_path(params[:restaurant_id])))
  end


  def remove_item
    dish = Dish.find(params[:dish_id])
    if /(\D+)/.match(params[:remove_amount]).nil?
      @cart.remove(dish, params[:remove_amount].to_i)
      flash[:notice] = "#{params[:remove_amount]} #{dish.name} was removed from your cart"
    else
      flash[:notice] = "Please enter a number"
    end
    redirect_back(fallback_location: (request.referer || restaurant_path(params[:restaurant_id])))
  end

  def show
    @cart = Cart.find(session[:cart_id])
  end
end
