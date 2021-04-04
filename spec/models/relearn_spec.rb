require 'rails_helper'

RSpec.describe Relearn, type: :model do
  before do
    @relearn = FactoryBot.build(:relearn)
  end
  describe '教えて欲しい投稿' do
    context '登録できるとき' do
      it '全ての項目を適正に入力すれば登録できる' do
        expect(@relearn).to be_valid
      end
      it '場所の詳細情報を入力しなくても登録できる' do
        @relearn.area_provided = nil
        expect(@relearn).to be_valid
      end

      it '条件を入力しなくても登録できる' do
        @relearn.condition = nil
        expect(@relearn).to be_valid
      end
    end

    context '新規登録できないとき' do
      it '教えたい内容のタイトルが空では登録できない' do
        @relearn.restudytitle = nil
        @relearn.valid?
        expect(@relearn.errors.full_messages).to include("Restudytitle can't be blank")
      end
      it '教えたい内容が空では登録できない' do
        @relearn.restudy = nil
        @relearn.valid?
        expect(@relearn.errors.full_messages).to include("Restudy can't be blank")
      end
      it 'active_hash【職業】が【１】では登録できないこと' do
        @relearn.job_id = '1'
        @relearn.valid?
        expect(@relearn.errors.full_messages).to include('Job must be other than 1')
      end
      it 'active_hash【性別】が【１】では登録できないこと' do
        @relearn.gender_id = '1'
        @relearn.valid?
        expect(@relearn.errors.full_messages).to include('Gender must be other than 1')
      end
      it 'active_hash【都道府県】が【１】では登録できないこと' do
        @relearn.prefecture_id = '1'
        @relearn.valid?
        expect(@relearn.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'active_hash【場所の提供】が【１】では登録できないこと' do
        @relearn.area_id = '1'
        @relearn.valid?
        expect(@relearn.errors.full_messages).to include('Area must be other than 1')
      end
      it 'active_hash【教育を受ける側の人数】が【１】では登録できないこと' do
        @relearn.learn_num_id = '1'
        @relearn.valid?
        expect(@relearn.errors.full_messages).to include('Learn num must be other than 1')
      end
    end
  end
  






end
#  テストで使用
#  bundle exec rspec spec/models/relearn_spec.rb
#  @relearn.errors.full_messages
