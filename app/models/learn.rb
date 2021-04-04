class Learn < ApplicationRecord
  belongs_to :user
  has_many :relearns
  # has_one :
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :gender
  belongs_to :job
  belongs_to :learn_num
  belongs_to :prefecture

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :studytitle
    validates :study
  end

  validates :thankyou_money, inclusion: { in: 1..10_000 }

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :area_id
    validates :gender_id
    validates :job_id
    validates :learn_num_id
    validates :prefecture_id
  end
end

