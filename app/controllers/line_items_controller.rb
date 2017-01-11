class LineItemsController < ApplicationController

  def create
    @item = Item.find_by_id(params[:item_id])
    if current_cart.items.include?(@item)
      @line_item = current_cart.line_items.find_by(item_id: @item.id)
      @line_item.quantity +=1
      @line_item.save
      redirect_to cart_path(current_cart)
    else  
      @line_item = LineItem.new(item_id: @item.id)
      @line_item.cart_id = current_cart.id
      @line_item.save
      redirect_to cart_path(current_cart)
    end
  end
end