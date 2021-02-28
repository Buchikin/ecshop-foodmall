class Charge < ApplicationRecord
  attr_accessor :token

  validates :pay, presence: true, numericality: { with: /\A[0-9]+\z/, message: "must be Half-width numbers"}
  validates :token, presence: true
  belongs_to :user
end
