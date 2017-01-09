class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable
  has_many :carts
  has_one :current_cart, class: Cart
   
  def current_cart
    Cart.find_or_create_by(user_id: self.id)
  end
 
end
