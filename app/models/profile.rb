class Profile < ApplicationRecord

  with_options presence: true do

    with_options format: { with: /\A[ぁ-んァ-ヶー一-龥]+\z/, message: "must be Full-width characters"} do
      validates :last_name
      validates :first_name
    end

    with_options format: { with: /\A[ァ-ヶー]+\z/, message: "must be Full-width katkana characters"} do
      validates :last_name_kana
      validates :first_name_kana
    end

    validates :birth_day
    validates :phone_number
    validates :zip_code
    validates :address

  end

  belongs_to :user
  
end
