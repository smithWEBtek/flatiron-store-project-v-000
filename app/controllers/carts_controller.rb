class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end
  
  def show
    current_cart
  end

  def checkout
    current_cart.update_inventory
    current_cart = nil
    redirect_to cart_path(params[:id])
  end
end
 