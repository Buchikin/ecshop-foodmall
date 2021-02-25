class Item < ApplicationRecord


  with_options presence: true do
    validates :name
    validates :information
    validates :image
    
    with_options numericality: { with: /\A[0-9]+\z/, message: "must be Half-width numbers"} do
      validates :price
    end

    with_options numericality: { other_than: 0 , message: "must be selected"}  do
      validates :prefecture_id
      validates :ship_day_id
      validates :ship_type_id
    end
  end

  with_options length: { maximum: 5, message: "must be 5 digits or less" }  do
    validates :tag1
    validates :tag2
    validates :tag3
    validates :tag4
    validates :tag5
  end

  belongs_to :seller
  has_one :stock
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :ship_day
  belongs_to :ship_type
end
