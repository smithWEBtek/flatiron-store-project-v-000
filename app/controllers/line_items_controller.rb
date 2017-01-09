class LineItemsController < ApplicationController

  def create
    @item = Item.find_by_id(params[:item_id])
    @cart = current_user.current_cart
    @cart.save
    @line_item = LineItem.find_or_create_by(item_id: @item.id, cart_id: @cart_id)
    @line_item.save
# binding.pry
     redirect_to cart_path(@cart)
  end
end
