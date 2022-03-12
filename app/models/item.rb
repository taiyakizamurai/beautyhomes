class Item < ApplicationRecord
    attachment :image
  belongs_to :trouble
  belongs_to :maker
  has_many :cart_items
  has_many :order_details
end
