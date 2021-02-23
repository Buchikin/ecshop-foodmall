class Item < ApplicationRecord


  belongs_to :seller
  has_one :stock
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :ship_day
  belongs_to :ship_type
end
