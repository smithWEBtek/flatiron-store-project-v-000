class CartsController < ApplicationController

  def show
    @user = User.find_by_id(params[:id])
    @current_cart = @user.current_cart
  end
   
  def create
    @cart = Cart.create(cart_params)
    if @cart.save
      redirect_to root_path
    end
  end

  def destroy
    @cart = Cart.find_by_id(params[:id])
    @cart.delete
  end

  def checkout
    Cart.find_by_id(params[:id]).destroy
  end

  private
    def cart_params
      params.require(:cart).permit(:user_id, :status)
    end

end
