10.times do 
  Item.create(
    title: Faker::Commerce.product_name, 
    inventory: Faker::Number.number(2), 
    price: Faker::Number.number(4)
  )
  Category.create(title: Faker::Commerce.department)
end

counter = 1
Item.all.each do |item|
  item.category_id = counter
  item.save
  counter += 1
end

@users = {}
@users = {
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
  ]
}

def make_users
  @users[:users].each do |user|
    new_user = User.new
    user.each_with_index do |attribute, i|
      new_user.send(@users[:user_keys][i]+"=", attribute)
    end
    new_user.save
  end
end

make_users

@categories = {}
@categories = {
  :category_keys =>
    ["title"], 
  :categories => [
    ["produce"], 
    ["clothing"], 
    ["office"], 
    ["wellness"]
  ]
 }

def make_categories
  @categories[:categories].each do |category|
    new_category = Category.new
    category.each_with_index do |attribute, i|
      new_category.send(@categories[:category_keys][i]+"=", attribute)
    end
    new_category.save
  end
end

make_categories

# @items = {}
# @items = {
#   :item_keys =>
#     ["title", "price", "inventory", "category_id"], 
#   :items => [
#     ["spinach", 2, 3, 1],
#     ["celery", 2, 3, 1],
#     ["beans", 2, 3, 1],
#     ["t-shirt", 2, 3, 2],
#     ["shoes", 2, 3, 2],
#     ["hat", 2, 3, 2],
#     ["paper", 2, 3, 3],
#     ["printer", 2, 3, 3],
#     ["laptop", 2, 3, 3],
#     ["vitamins", 2, 3, 4],
#     ["meditation tracks", 2, 3, 4],
#     ["pro-biotics", 2, 3, 4]
#   ]
# }

# def make_items
#   @items[:items].each do |item|
#     new_item = Item.new
#     item.each_with_index do |attribute, i|
#       new_item.send(@items[:item_keys][i]+"=", attribute)
#     end
#     new_item.save
#   end
# end

# make_items

# @carts = {}
# @carts = {
#   :cart_keys =>
#    ["user_id"],
#   :carts => [
#     [1],
#     [2],
#     [3],
#     [4],
#     [5],
#     [6],
#     [7],
#     [8],
#     [9]
#   ]
# }
 
# def make_carts
#   @carts[:carts].each do |cart|
#     new_cart = Cart.new
#     cart.each_with_index do |attribute, i|
#       new_cart.send(@carts[:cart_keys][i]+"=", attribute)
#     end
#     new_cart.save
#   end
# end

# make_carts 

@orders = {}
@orders = {
  :order_keys =>
    ["user_id", "cart_id"], 
  :orders => [
    [1, 1],
    [2, 2],
    [3, 3],
    [4, 4]
  ]
}

def make_orders
  @orders[:orders].each do |order|
    new_order = Order.new
    order.each_with_index do |attribute, i|
      new_order.send(@orders[:order_keys][i]+"=", attribute)
    end
    new_order.save
  end
end

make_orders 

# @line_items = {}
# @line_items = {
#   :line_item_keys =>
#     ["item_id", "cart_id", "order_id", "quantity"], 
#   :line_items => [
#     [1, 1, 1, 2],
#     [2, 1, 1, 1],
#     [3, 1, 1, 1],
#     [4, 2, 2, 2],
#     [5, 2, 2, 1],
#     [6, 2, 2, 1],
#     [7, 3, 3, 2],
#     [8, 3, 3, 1],
#     [9, 3, 3, 1]
#   ]
# }

# def make_line_items
#   @line_items[:line_items].each do |line_item|
#     new_line_item = LineItem.new
#     line_item.each_with_index do |attribute, i|
#       new_line_item.send(@line_items[:line_item_keys][i]+"=", attribute)
#     end
#     new_line_item.save
#   end
# end

# make_line_items

