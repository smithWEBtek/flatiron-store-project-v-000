class Item < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  def self.available_items
    available_items = []
    Item.all.each do |item|
      available_items << item if item.inventory > 0
    end
    available_items
  end
end