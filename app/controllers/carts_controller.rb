class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end

  def show
    @cart = Cart.find(params[:id])
  end
 
  def checkout
    current_cart.checkout
    current_cart = nil

    redirect_to cart_path(params[:id].to_i)
  end

end