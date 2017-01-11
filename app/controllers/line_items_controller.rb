class LineItemsController < ApplicationController

  def create
    @item = Item.find_by_id(params[:item_id])
    @cart = current_cart 
    @cart.save
    if @cart.items.include?(@item)
      @line_item = @cart.line_items.find_by(item_id: @item.id)
      @line_item.quantity +=1
      @line_item.save
    else  
      @line_item = LineItem.new(item_id: @item.id)
      @line_item.cart_id = @cart.id
      @line_item.save
    
    redirect_to cart_path(@cart)
    end
  end
end