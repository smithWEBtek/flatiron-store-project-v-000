class StoreController < ApplicationController
  
  def index 
    @categories = Category.all 
  end

  def users
    @users = User.all
    render 'users'
  end
end
