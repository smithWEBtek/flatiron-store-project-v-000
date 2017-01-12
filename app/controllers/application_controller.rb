class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :number_to_currency, :current_cart, :admin
 
  # def carts
  #   @carts = Cart.all
  # end

  def current_cart
    current_cart ||= current_user.current_cart unless !logged_in?
  end

  def current_cart=
    current_cart
  end

  def logged_in?
    !!current_user
  end

  def number_to_currency(price)
    "$#{"%.2f" % (price / 100.0)}"
  end

  def admin
    @categories = Category.all
    @items = Item.all 
    @users = User.all
    @carts = Cart.all
    render 'admin/index'
  end
end
