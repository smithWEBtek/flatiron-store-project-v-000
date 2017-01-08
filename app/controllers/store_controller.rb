class StoreController < ApplicationController
  
  def index 
    @categories = Category.all 
    # current_cart.save
  end

  def users
    @users = User.all
    render 'users'
  end
end
