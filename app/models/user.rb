class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable
  has_many :carts
  has_one :current_cart, class: Cart
   
  def current_cart
    @current_cart ||= Cart.new(user_id: self.id)
  end

  def current_cart=(cart)
    cart = Cart.find_by(self.id)
  end


end