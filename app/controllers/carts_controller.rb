class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end
  
  def show
# raise params.inspect
    @cart = Cart.find(params["id"].to_i)
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
    # binding.pry

    redirect_to cart_path(@cart)
  end
 
end