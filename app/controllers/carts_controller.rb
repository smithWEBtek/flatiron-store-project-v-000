class CartsController < ApplicationController
helper_method :current_cart
  ######################
  # def current_cart
  #   if current_user
  #     current_user.current_cart
  #   end
  # end
######################

  def current_cart
    @current_cart ||= Cart.find_by(user_id: current_user.id) 
  end

  def current_cart=(cart)
    cart = Cart.create(user_id: current_user.id) 
    @current_cart = cart
    @current_cart.save
  end
######################

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
