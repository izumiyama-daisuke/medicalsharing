class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :learns
  has_many :relearns
  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください', on: :create

  with_options presence: true do
    validates :nickname, on: :create
    validates :password_confirmation, on: :create
    validates :birthday, on: :create
  end

  NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/.freeze
  validates_format_of :first_name, presence: true, with: NAME_REGEX, message: '全角（漢字・ひらがな・カタカナ）を使用してください', on: :create
  validates_format_of :last_name, presence: true, with: NAME_REGEX, message: '全角（漢字・ひらがな・カタカナ）を使用してください', on: :create

  NAME_KANA_REGEX = /\A[ァ-ヶ一]+\z/.freeze
  validates_format_of :first_kana, presence: true, with: NAME_KANA_REGEX, message: 'に全角（カタカナ）を使用してください', on: :create
  validates_format_of :last_kana, presence: true, with: NAME_KANA_REGEX, message: 'に全角（カタカナ）を使用してください', on: :create
end

