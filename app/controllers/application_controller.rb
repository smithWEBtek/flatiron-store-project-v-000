class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :number_to_currency, :current_cart


  def logged_in?
    !!current_user
  end


# ######################
#   def current_cart
#     if current_user
#       current_user.current_cart
#     end
#   end
# ######################

#   def current_cart
#     @current_cart ||= Cart.find_by(user_id: current_user.id) 
#   end

#   def current_cart=(cart)
#     cart = Cart.create(user_id: current_user.id) 
#     @current_cart = cart
#     @current_cart.save
#   end
# ######################

 def number_to_currency(price)
    "$#{price.to_f/100}" 
  end


end
