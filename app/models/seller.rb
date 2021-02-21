class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze  #半角英数どちらも含む
  validates_format_of :password, with: PASSWORD_REGEX, message: "must be included both letter(Half-width) and number", on: :create
  validates_format_of :store_id, with: PASSWORD_REGEX, message: "must be included both letter(Half-width) and number"

  validates :store_id, presence: true
  validates :store_name, presence: true

  has_one :store
  accepts_nested_attributes_for :store, update_only: true
end
