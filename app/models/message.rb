class Message < ApplicationRecord

    
  with_options presence: true do
    validates :item_name
    validates :message
    validates :whom
  end

  belongs_to :room
end
