class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items
 
  def add_item(item_id)
    line_item = self.line_items.find_by(item_id: item_id)
    if line_item
      line_item.quantity += 1
    else
      line_item = self.line_items.build(item_id: item_id)
    end
    line_item
  end

  def subtotal(line_item)
    if line_item.item.inventory >= line_item.quantity
      @subtotal = line_item.quantity * line_item.item.price
    end
  end

  def total
    @total = 0
    self.line_items.each do |line_item|
       @total = @total + subtotal(line_item)
    end
    @total
  end

  def update_inventory
    self.line_items.each do |line_item|
      line_item.item.inventory = line_item.item.inventory - line_item.quantity
      line_item.item.save
      self.status = "submitted"
      self.save      
    end
  end
end
