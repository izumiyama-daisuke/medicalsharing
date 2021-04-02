class Relearn < ApplicationRecord
  belongs_to :user
  belongs_to :learn

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :gender
  belongs_to :job
  belongs_to :learn_num
  belongs_to :prefecture
end
