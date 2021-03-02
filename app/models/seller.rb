class Seller < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable
  devise :database_authenticatable, :authentication_keys => [:store_id]

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze  #半角英数どちらも含む
  validates_format_of :password, with: PASSWORD_REGEX, message: "must be included both letter(Half-width) and number", on: :create
  validates_format_of :store_id, with: PASSWORD_REGEX, message: "must be included both letter(Half-width) and number"

  validates :store_id, presence: true
  validates :store_name, presence: true
  validates :store_id, uniqueness: true

  has_one :store
  accepts_nested_attributes_for :store, update_only: true
  has_many :items
  has_many :rooms
  has_many :favorite_sellers

  def email_required?
    false
  end

  def email_changed?
    false
  end

end
