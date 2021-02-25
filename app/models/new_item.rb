class NewItem

  include ActiveModel::Model
  attr_accessor :name, :price, :information, :tag1, :tag2, :tag3, :tag4, :tag5, :allergies, :prefecture_id, :ship_day_id, :ship_type_id, :seller_id, :count, :image

  with_options presence: true do
    validates :name
    validates :information
    validates :image
    
    with_options numericality: { with: /\A[0-9]+\z/, message: "must be Half-width numbers"} do
      validates :price
      validates :count
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

  def save
    item = Item.create(name: name, price: price, information: information, tag1: tag1, tag2: tag2, tag3: tag3, tag4: tag4, tag5: tag5, prefecture_id: prefecture_id, ship_day_id: ship_day_id, ship_type_id: ship_type_id, seller_id: seller_id, image: image, allergies: allergies)
    Stock.create(count: count, item_id: item.id)
  end


end