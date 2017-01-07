class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :logged_in?, :number_to_currency

  def logged_in?
    if current_user
      true
    else
      false
    end
  end

  def number_to_currency(price)
    "$#{price.to_f/100}" 
  end
end
