class Order < ApplicationRecord
  
  belongs_to :item
  belongs_to :user
  has_one :shipping
  has_one :review
  
end
