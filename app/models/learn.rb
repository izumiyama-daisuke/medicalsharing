class Learn < ApplicationRecord
  belongs_to :user
  # has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :gender
  belongs_to :job
  belongs_to :learn_num
  belongs_to :prefecture

  # 空の投稿を保存できないようにする
  with_options presence: true do
    validates :study
  end

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :area_id
    validates :gender_id
    validates :job_id
    validates :learn_num_id
    validates :prefecture_id
  end
end

# class Item < ApplicationRecord
#  belongs_to :user
#  has_one :order
#  has_many_attached :images

#  extend ActiveHash::Associations::ActiveRecordExtensions
#  belongs_to :category
#  belongs_to :state
#  belongs_to :delivery_fee
#  belongs_to :prefecture
#  belongs_to :day

#  with_options presence: true do
#    validates :item_name
#    validates :description
#    validates :images
#    validates :price, inclusion: { in: 300..9_999_999 }
#  end

#  with_options numericality: { other_than: 1 } do
#    validates :category_id
#    validates :state_id
#    validates :delivery_fee_id
#    validates :prefecture_id
#    validates :day_id
#  end
# end
