class LineItemsController < ApplicationController
binding.pry

  def create 
binding.pry
    @line_item = LineItem.create(line_item_params)
    if @line_item.save
      @line_item
    else
      flash = "Some Ting Wong"
    end
  end

end
