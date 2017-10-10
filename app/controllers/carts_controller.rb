class CartsController < ApplicationController

  def add
    dish = Dish.find(params[:id])
    if session[:cart_id]
      show
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
    @cart.add(dish, dish.price)
    flash[:notice] = "#{dish.name} added to cart"
    redirect_to restaurant_path(params[:restaurant_id])
  end

  def remove_item
    dish = Dish.find(params[:dish_id])
    if session[:cart_id]
      show
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
    @cart.remove(dish, 1)
    flash[:notice] = "#{dish.name} was removed from your order"
    redirect_to restaurant_path(params[:restaurant_id])
  end

  def show
    @cart = Cart.find(session[:cart_id])
  end
end