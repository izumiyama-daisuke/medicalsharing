require 'rails_helper'

RSpec.describe Relearn, type: :model do
  before do
    @learn = FactoryBot.build(:learn)
  end

  describe '教えて欲しい投稿' do
    context '登録できるとき' do
      it '全ての項目を適正に入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
    end
  end






end
#  テストで使用
#  bundle exec rspec spec/models/learn_spec.rb
#  @learn.errors.full_messages
