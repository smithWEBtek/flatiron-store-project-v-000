class StoreController < ApplicationController
  
  def index 
    @categories = Category.all 
    @items = Item.available_items
  end

  def users
    @users = User.all
    render 'users'
  end
end
