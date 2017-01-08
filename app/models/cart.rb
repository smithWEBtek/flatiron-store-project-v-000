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

  def subtotal(litem)
    if litem.item.inventory >= litem.quantity
      @subtotal = litem.quantity * litem.item.price
    end
  end

  def total
    @total = 0
    self.line_items.each do |litem|
       @total = @total + subtotal(litem)
    end
    @total
  end

end
