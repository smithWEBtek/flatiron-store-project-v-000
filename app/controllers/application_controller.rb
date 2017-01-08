class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :number_to_currency, :current_cart

  def logged_in?
    !!current_user
  end

  def number_to_currency(price)
    "$#{price.to_f/100}" 
  end

  def current_cart
    @current_cart ||= Cart.new(user_id: self.id)
  end

  def current_cart=(cart)
    cart = Cart.find_by(self.id)
  end
end
