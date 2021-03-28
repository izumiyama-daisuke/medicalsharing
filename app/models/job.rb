class Job < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '医師' },
    { id: 3, name: '看護師' },
    { id: 4, name: '准看護師' },
    { id: 5, name: '放射線技師' },
    { id: 6, name: '臨床検査技師' },
    { id: 7, name: '薬剤師' },
    { id: 8, name: '心理士' },
    { id: 9, name: '救命士' },
    { id: 10, name: '医療事務' },
    { id: 11, name: '学生（医師）' },
    { id: 12, name: '学生（看護師）' },
    { id: 13, name: '学生（准看護師）' },
    { id: 14, name: '学生（放射線技師）' },
    { id: 15, name: '学生（臨床検査技師）' },
    { id: 16, name: '学生（薬剤師）' },
    { id: 17, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :learns
end
