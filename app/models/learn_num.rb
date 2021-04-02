class LearnNum < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '１人' },
    { id: 3, name: '２人' },
    { id: 4, name: '３人' },
    { id: 5, name: '４〜１０人' },
    { id: 6, name: '１０〜２０人' },
    { id: 7, name: '２０人以上' },
    { id: 8, name: '未定' }
  ]

  include ActiveHash::Associations
  has_many :learns
  has_many :relearns
end
