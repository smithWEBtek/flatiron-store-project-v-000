class CartsController < ApplicationController
 
  def current_cart
    if current_user
      current_user.current_cart
    end
  end
 
  def index
    @carts = Cart.all
  end

  def show
    @user = User.find_by_id(params[:id])
  end

  def checkout 
    @cart =  Cart.find_by_id(params[:id])
    @total = @cart.total
    @cart.status = nil
    @cart.save
     redirect_to cart_path(@cart)
  end
end
