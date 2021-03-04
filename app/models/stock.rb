class Stock < ApplicationRecord

  validates :count, presence: true, numericality: { with: /\A[0-9]+\z/, message: "must be Half-width numbers"}, numericality: { :greater_than_or_equal_to => 0 , :less_than_or_equal_to => 10000 , message:"must be 0~10000" }

  belongs_to :item
end
