class CartsController < ApplicationController

  def show
    @current_cart = User.find_by_id(params[:id]).current_cart
# binding.pry
    
    # # should have user_id: current_user.id
    # # current_user should be logged_in
    # # navigable by /users/:id/carts/:id
  end
   
  def create
  end

end
