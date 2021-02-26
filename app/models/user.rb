class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable


  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze  #半角英数どちらも含む
  validates_format_of :password, with: PASSWORD_REGEX, message: "must be included both letter(Half-width) and number", on: :create

  validates :nickname, presence: true

  has_one :profile
  accepts_nested_attributes_for :profile, update_only: true
  has_one :charge


  def update_without_current_password(params, *options)
    params.delete(:current_password)

    if params[:password].blank? && params[:password_confirmation].blank?
      params.delete(:password)
      params.delete(:password_confirmation)
    end

    result = update_attributes(params, *options)
    clean_up_passwords
    result
  end

  
end
