class ShipType < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '通常発送' },
    { id: 2, name: 'クール便(冷蔵)' },
    { id: 3, name: 'クール便(冷凍)' }
  ]

  include ActiveHash::Associations
  has_many :items
end
