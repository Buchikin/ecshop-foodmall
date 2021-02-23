class NewItem

  include ActiveModel::Model
  attr_accessor :name, :price, :information, :tag1, :tag2, :tag3, :tag4, :tag5, :allergies, :prefecture_id, :ship_day_id, :ship_type_id, :seller_id, :count, :item_id

  with_options presence: true do
    validates :name
    validates :information
    validates :image
    validates :allergies
    
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


end