class NewOrder
  include ActiveModel::Model
  attr_accessor :last_name, :first_name, :last_name_kana, :first_name_kana, :zip_code , :address, :quantity, :purchase_price, :item_id, :user_id


  with_options presence: true do

    with_options format: { with: /\A[ぁ-んァ-ヶー一-龥]+\z/, message: "must be Full-width characters"} do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー]+\z/, message: "must be Full-width katkana characters"} do
      validates :last_name_kana
      validates :first_name_kana
    end

    validates :zip_code
    validates :address

    validates :quantity, numericality: { with: /\A[0-9]+\z/, message: "must be Half-width numbers"}
    validates :purchase_price, numericality: { with: /\A[0-9]+\z/, message: "must be Half-width numbers"}


  end

  def save
    order = Order.create( quantity: quantity, purchase_price: purchase_price, item_id: item_id, user_id: user_id)
    Shipping.create(last_name: last_name, first_name: first_name, last_name_kana: last_name_kana, first_name_kana: first_name_kana, zip_code: zip_code , address: address, order_id: order.id)
  end


end