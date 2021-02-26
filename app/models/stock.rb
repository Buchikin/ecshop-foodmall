class Stock < ApplicationRecord

  validates :count, presence: true, numericality: { with: /\A[0-9]+\z/, message: "must be Half-width numbers"}

  belongs_to :item
end
