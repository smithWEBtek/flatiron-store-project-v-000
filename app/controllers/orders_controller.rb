class OrdersController < ApplicationController

  def show
raise params.inspect
    @order = Order.find_by_id(params[:id])
  end
end
