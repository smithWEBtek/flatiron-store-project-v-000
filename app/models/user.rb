class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable
  # ,
  #        :recoverable, :rememberable, :trackable, :validatablelearn

  has_many :carts
  # belongs_to :current_cart, class_name: 'Cart' ### from lab review video, doubting that it is needed
  
 
  def current_cart
    @current_cart ||= Cart.new(user_id: self.id)
  end

  def current_cart=(cart)
    cart = Cart.find_by(self.id)
  end
end