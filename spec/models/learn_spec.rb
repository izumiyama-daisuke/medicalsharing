require 'rails_helper'

RSpec.describe Relearn, type: :model do
  before do
    @learn = FactoryBot.build(:learn)
  end

  describe '教えて欲しい投稿' do
    context '登録できるとき' do
      it '全ての項目を適正に入力すれば登録できる' do
        expect(@learn).to be_valid
      end
      it '場所の詳細情報を入力しなくても登録できる' do
        @learn.area_provided = nil
        expect(@learn).to be_valid
      end
      it '教育を受ける側の一人あたりのお礼金を入力しなくても登録できる' do
        @learn.thankyou_money = nil
        expect(@learn).to be_valid
      end
      it '条件を入力しなくても登録できる' do
        @learn.condition = nil
        expect(@learn).to be_valid
      end
    end

    context '新規登録できないとき' do
      it '学びたい内容のタイトルが空では登録できない' do
        @learn.studytitle = nil
        @learn.valid?
        expect(@learn.errors.full_messages).to include("Studytitle can't be blank")
      end
      it '学びたい内容が空では登録できない' do
        @learn.study = nil
        @learn.valid?
        expect(@learn.errors.full_messages).to include("Study can't be blank")
      end
      it 'active_hash【職業】が【１】では登録できないこと' do
        @learn.job_id = '1'
        @learn.valid?
        expect(@learn.errors.full_messages).to include('Job must be other than 1')
      end
      it 'active_hash【性別】が【１】では登録できないこと' do
        @learn.gender_id = '1'
        @learn.valid?
        expect(@learn.errors.full_messages).to include('Gender must be other than 1')
      end
      it 'active_hash【都道府県】が【１】では登録できないこと' do
        @learn.prefecture_id = '1'
        @learn.valid?
        expect(@learn.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'active_hash【場所の提供】が【１】では登録できないこと' do
        @learn.area_id = '1'
        @learn.valid?
        expect(@learn.errors.full_messages).to include('Area must be other than 1')
      end
      it 'active_hash【教育を受ける側の人数】が【１】では登録できないこと' do
        @learn.learn_num_id = '1'
        @learn.valid?
        expect(@learn.errors.full_messages).to include('Learn num must be other than 1')
      end
    end
  end






end
#  テストで使用
#  bundle exec rspec spec/models/learn_spec.rb
#  @learn.errors.full_messages
