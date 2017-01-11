class CartsController < ApplicationController

  def index
    @carts = Cart.all
  end
  
  def show
    @cart = Cart.find(params["id"].to_i)
  end
   
  def create
    @cart = Cart.create(cart_params)
    if @cart.save
      redirect_to root_path
    end
  end

  def checkout
    @cart = Cart.find_by_id(params[:id])
    process_cart
    @user = current_user
    redirect_to cart_path(@cart.id)
  end

  def process_cart
    @cart.line_items.each do |litem|
      litem.item.inventory = litem.item.inventory - litem.quantity
      litem.item.save
 
      @cart.status = "submitted"
      @cart.save
     end
   end
end
 