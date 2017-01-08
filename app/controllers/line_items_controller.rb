class LineItemsController < ApplicationController

  def create 
 # raise params.inspect
    @line_item = LineItem.new(item_id: params[:format].to_i)
    
    @cart = current_user.current_cart
    @cart.save
    @line_item.cart_id = @cart.id 
    if @line_item.save
      flash[:notice] = "Item added to cart"
      redirect_to carts_path
    else
      flash[:notice] = "Some Ting Wong"
    end
  end



end
