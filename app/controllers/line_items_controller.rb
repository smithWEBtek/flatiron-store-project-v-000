class LineItemsController < ApplicationController


  def new
    @line_item = LineItem.new
  end

  def create 
    @line_item = LineItem.new(line_item_params)
    if @line_item.save
      @line_item
    else
      flash = "Some Ting Wong"
    end
  end

  private
  def line_item_params
    params.require(:line_item).permit(:item_id, :cart_id)
  end
  
 
end
