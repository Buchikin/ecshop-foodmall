class Charge < ApplicationRecord

  validates :pay, presence: true, numericality: { with: /\A[0-9]+\z/, message: "must be Half-width numbers"}

  belongs_to :user
end
