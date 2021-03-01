class Review < ApplicationRecord
  
  with_options presence: true do
    validates :evaluation
    validates :text
  end

  belongs_to :order
  belongs_to :user
  belongs_to :item

end
