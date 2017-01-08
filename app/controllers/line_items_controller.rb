class LineItemsController < ApplicationController

  def create 
    @item = Item.find_by_id(params[:format].to_i)
    @cart = current_user.current_cart
    @line_item = LineItem.create(item_id: @item.id, cart_id: @cart.id)
    if @line_item.save
      @cart.save
      if @cart.save
        current_cart = @cart
        flash[:notice] = "#{@item.title} added to cart"
        redirect_to carts_path
      else
        flash[:notice] = "That didn't work, better check it out."
      end
    end
  end

end
