class Store < ApplicationRecord

  with_options presence: true do

    with_options format: { with: /\A[ぁ-んァ-ヶー一-龥]+\z/, message: "must be Full-width characters"} do
      validates :responsible
    end

    with_options format: { with: /\A[ァ-ヶー]+\z/, message: "must be Full-width katkana characters"} do
      validates :responsible_kana
    end

    validates :shopcategory_id
    validates :zip_code
    validates :address
    validates :phone_number
    validates :information
    validates :responsible_phone
    validates :image

  end

  belongs_to :seller

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :shopcategory

end
