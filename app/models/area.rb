class Area < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '教育者側が用意' },
    { id: 3, name: '学びたい側が用意' },
    { id: 4, name: '今は未定' }
  ]

  include ActiveHash::Associations
  has_many :learns
  has_many :relearns
end
