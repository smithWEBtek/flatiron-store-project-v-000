class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :number_to_currency, :current_cart
 
  def current_cart
    current_cart ||= current_user.current_cart
  end

  def logged_in?
    !!current_user
  end

  def number_to_currency(price)
    "$#{price.to_f/100}" 
  end

end
