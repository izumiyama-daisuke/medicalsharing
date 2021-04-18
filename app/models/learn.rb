class Learn < ApplicationRecord
  belongs_to :user
  has_many :relearns, dependent: :destroy
  # has_one :
  has_one_attached :image
  has_many :rooms, dependent: :destroy

  def self.search(search)
    if search != ""
      Learn.where (['study LIKE(?) or studytitle LIKE(?)' , "%#{search}%", "%#{search}%"])
      #Learn.where('study LIKE(?)', "%#{search}%")
    else
      Learn.all
    end
  end

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

  #validates :thankyou_money, inclusion: { in: 0..100_000 }

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :area_id
    validates :gender_id
    validates :job_id
    validates :learn_num_id
    validates :prefecture_id
  end
end


private
def search   #検索用に記述
  @learns = Learn.search(params[:keyword])
end