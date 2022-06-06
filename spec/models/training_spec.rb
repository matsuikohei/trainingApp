require 'rails_helper'

RSpec.describe Training, type: :model do
  before do
    @training = FactoryBot.build(:training)
  end
  describe '研修内容新規登録' do
    context '登録できる' do
      it '必要な情報を入力すれば登録できる' do
        expect(@training).to be_valid
      end
    end

    context '登録できない' do
      it '研修実施日が空では登録できない' do
        @training.training_date = nil
        @training.valid?
        expect(@training.errors.full_messages).to include("Training date can't be blank")
      end
      it '研修実施日が今日以降では登録できない' do
        @training.training_date = Faker::Date.forward(days: 14)
        @training.valid?
        expect(@training.errors.full_messages).to include("Training date can't be in the future")
      end
      it '研修カテゴリーが空では登録できない' do
        @training.training_category_id = ''
        @training.valid?
        expect(@training.errors.full_messages).to include('Training category is not a number')
      end
      it '研修カテゴリーが「---」では登録できない' do
        @training.training_category_id = '1'
        @training.valid?
        expect(@training.errors.full_messages).to include('Training category must be other than 1')
      end
      it '研修内容が空では登録できない' do
        @training.content = ''
        @training.valid?
        expect(@training.errors.full_messages).to include("Content can't be blank")
      end
      it '研修実施者が空では登録できない' do
        @training.trainer_id = ''
        @training.valid?
        expect(@training.errors.full_messages).to include("Trainer can't be blank")
      end
    end
  end
end
