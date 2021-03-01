class Room < ApplicationRecord

  
  belongs_to :user
  belongs_to :seller
  has_many :messages
end
