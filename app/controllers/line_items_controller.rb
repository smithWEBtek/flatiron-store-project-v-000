class LineItemsController < ApplicationController

  def create
  # raise params.inspect
 #  params => {"item_id"=>"1", "controller"=>"line_items", "action"=>"create"}
 #  params => {"item_id"=>"6", "controller"=>"line_items", "action"=>"create"}

    @item = Item.find_by_id(params[:item_id])
# @item  => #<Item:0x007f8ea4cf01e0
 # id: 1,
 # title: "Mediocre Bronze Watch",
 # price: 7246,
 # inventory: 78,
 # category_id: 1> 

    @cart = current_cart 
# binding.pry
    @cart.save
    if @cart.items.include?(@item)
      @line_item = @cart.line_items.find_by(item_id: @item.id)
# binding.pry
      @line_item.update(quantity: 2)
# binding.pry
    else
      @line_item = LineItem.new(item_id: @item.id)
      @line_item.cart_id = @cart.id
      @line_item.save 
# binding.pry
    redirect_to cart_path(@cart)
    end
  end
end
