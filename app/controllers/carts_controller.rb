class CartsController < ApplicationController

  def add
    dish = Dish.find(params[:id])
    find_cart
    quantity = params[:amount].nil? ? 1 : params[:amount]
    @cart.add(dish, dish.price)
    flash[:notice] = "#{dish.name} added to cart: #{quantity}"
    redirect_back(fallback_location: (request.referer || restaurant_path(params[:restaurant_id])))
  end

  def remove_item
    dish = Dish.find(params[:dish_id])
    find_cart
    @cart.remove(dish, 1)
    flash[:notice] = "#{dish.name} was removed from your cart"
    redirect_to restaurant_path(params[:restaurant_id])
  end

  def show
    @cart = Cart.find(session[:cart_id])
  end

  def find_cart
    if session[:cart_id]
      @cart = Cart.find(session[:cart_id])
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
end
