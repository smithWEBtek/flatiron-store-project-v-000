class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end
  
  def show
    @cart = Cart.find(params[:id])
  end
   
  def create
    @cart = Cart.create(cart_params)
    if @cart.save
      redirect_to root_path
    end
  end

  def clear_cart
    current_cart.clear_cart
    redirect_to cart_path(current_cart)
  end

  def checkout
    @cart =  Cart.find_by_id(params[:id])
    @total = @cart.total
    @cart.status = "submitted"
    @cart.save
     render 'checkout'
  end
 
end