class Relearn < ApplicationRecord
  belongs_to :user
  belongs_to :learn

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :gender
  belongs_to :job
  belongs_to :learn_num
  belongs_to :prefecture


  # 空欄の時は保存できないようにする
  with_options presence: true do
    validates :restudytitle
    validates :restudy
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
