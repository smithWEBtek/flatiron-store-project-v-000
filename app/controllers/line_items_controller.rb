class LineItemsController < ApplicationController

  def create
    @item = Item.find_by_id(params[:item_id])
    @cart = current_user.current_cart
    @cart.save
# binding.pry
    @line_item = LineItem.create(item_id: @item.id, cart_id: @cart.id)
     if @line_item.save
     
        
        flash[:notice] = "#{@item.title} added to cart"
        redirect_to cart_path(current_cart)
      else
        flash[:notice] = "That didn't work, better check it out."
       
    end
  end

end
