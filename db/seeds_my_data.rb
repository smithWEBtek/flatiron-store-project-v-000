# coding: utf-8
DATA = {
  :user_keys =>
    ["email", "password"],
  :users => [
    ["max@abc.com", "pointer"],
    ["skai@abc.com", "pointer"],
    ["kaleo@abc.com", "pointer"],
    ["megan@abc.com", "pointer"],
    ["tenzing@abc.com", "pointer"],
    ["davis@abc.com", "pointer"],
    ["cole@abc.com", "pointer"],
    ["ted@abc.com", "pointer"],
    ["fred@abc.com", "pointer"]
  ],

  :category_keys =>
    ["title"], 
  :categories => [
    ["produce"], 
    ["clothing"], 
    ["office"], 
    ["wellness"]
  ],
 
  :item_keys =>
    ["title", "price", "inventory", "category_id"], 
  :items => [
    ["spinach", 2, 3, 1],
    ["celery", 2, 3, 1],
    ["beans", 2, 3, 1],
    ["t-shirt", 2, 3, 2],
    ["shoes", 2, 3, 2],
    ["hat", 2, 3, 2],
    ["paper", 2, 3, 3],
    ["printer", 2, 3, 3],
    ["laptop", 2, 3, 3],
    ["vitamins", 2, 3, 4],
    ["meditation tracks", 2, 3, 4],
    ["pro-biotics", 2, 3, 4]
  ],

  :cart_keys =>
   ["user_id"],
  :carts => [
    [1],
    [2],
    [3],
    [4],
    [5],
    [6],
    [7],
    [8],
    [9]
  ],

  :order_keys =>
    ["user_id", "cart_id"], 
  :orders => [
    [1, 1],
    [2, 2],
    [3, 3],
    [4, 4]
  ],

  :line_item_keys =>
    ["item_id", "cart_id", "order_id", "quantity"], 
  :line_items => [
    [1, 1, 1, 2],
    [2, 1, 1, 1],
    [3, 1, 1, 1],
    [4, 2, 2, 2],
    [5, 2, 2, 1],
    [6, 2, 2, 1],
    [7, 3, 3, 2],
    [8, 3, 3, 1],
    [9, 3, 3, 1]
  ],
}

def main
  make_users
  make_categories
  make_items
  make_carts  
  make_orders  
  make_line_items
end

def make_users
  DATA[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(DATA[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

def make_categories
  DATA[:categories].each do |category|
    new_category = Category.new
    category.each_with_index do |attribute, i|
      new_category.send(DATA[:category_keys][i]+"=", attribute)
    end
    new_category.save
  end
end

def make_items
  DATA[:items].each do |item|
    new_item = Item.new
    item.each_with_index do |attribute, i|
      new_item.send(DATA[:item_keys][i]+"=", attribute)
    end
    new_item.save
  end
end

def make_carts
  DATA[:carts].each do |cart|
    new_cart = Cart.new
    cart.each_with_index do |attribute, i|
      new_cart.send(DATA[:cart_keys][i]+"=", attribute)
    end
    new_cart.save
  end
end

def make_orders
  DATA[:orders].each do |order|
    new_order = Order.new
    order.each_with_index do |attribute, i|
      new_order.send(DATA[:order_keys][i]+"=", attribute)
    end
    new_order.save
  end

def make_line_items
  DATA[:line_items].each do |line_item|
    new_line_item = LineItem.new
    line_item.each_with_index do |attribute, i|
      new_line_item.send(DATA[:line_item_keys][i]+"=", attribute)
    end
    new_line_item.save
  end
end
 

# later on, use this to randomly generate carts
# def make_attractions_and_rides
#   DATA[:attractions].each do |attraction|
#     new_attraction = Attraction.new
#     attraction.each_with_index do |attribute, i|
#       new_attraction.send(DATA[:attraction_keys][i] + "=", attribute)
#     end
#     rand(1..3).times do
#       customers = []
#       User.all.each {|u| customers << u if u.admin != true}
#       new_attraction.users << customers[rand(0...customers.length)]
#     end
#     new_attraction.users.each {|c| c.save}
#     new_attraction.save
#   end
# end

end 

main
