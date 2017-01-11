class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end
  
  def show
    @cart = Cart.find(params["id"].to_i)
  end
   
  def create
    user.current_cart 
    redirect_to root_path
  end

  def checkout
    current_cart.update_inventory
    current_cart = nil
    redirect_to cart_path(current_user.current_cart)
  end
 
end
 