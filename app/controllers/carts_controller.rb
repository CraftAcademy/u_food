class CartsController < ApplicationController

  def add
    dish = Dish.find(params[:id])
    if session[:cart_id]
      find_cart
    else
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
    @cart.add(dish, dish.price)
    flash[:notice] = "#{dish.name} added to cart"
    redirect_to restaurant_path(params[:restaurant_id])
  end

  def find_cart
    @cart = Cart.find(session[:cart_id])
  end

   def show
     @cart = Cart.find(session[:cart_id])
     @shopping_cart_items = @cart.shopping_cart_items
   end
end