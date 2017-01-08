class CartsController < ApplicationController

  def show
    @user = User.find_by_id(params[:id])
  end
   
  def create
    @cart = Cart.create(cart_params)
    if @cart.save
      redirect_to root_path
    end
  end

  def checkout
    @cart =  Cart.find_by_id(params[:id])
    @total = @cart.total
    @cart.status = "submitted"
    @cart.save
     render 'checkout'
  end

  def destroy
    @cart = Cart.find_by_id(params[:id])

    @cart.delete
  end

  # private
  #   def cart_params
  #     params.require(:cart).permit(:user_id, :status)
  #   end
end
