class OrdersController < ApplicationController

  def show
    @order = Order.find_by_id(params[:id])
  end
end
