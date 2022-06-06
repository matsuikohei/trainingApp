require 'rails_helper'

RSpec.describe Test, type: :model do
  before do
    @test = FactoryBot.build(:test)
  end
  describe '試験結果新規登録' do
    context '登録できる' do
      it '必要な情報を入力すれば登録できる' do
        expect(@test).to be_valid
      end
      it 'コメントが空でも登録できる' do
        @test.comment = ""
        expect(@test).to be_valid
      end
      it '試験の点数が0点でも登録できる' do
        @test.result = 0
        expect(@test).to be_valid
      end
      it '試験の点数が100点でも登録できる' do
        @test.result = 100
        expect(@test).to be_valid
      end
    end

    context '登録できない' do
      it '試験実施日が空では登録できない' do
        @test.test_date = nil
        @test.valid?
        expect(@test.errors.full_messages).to include("Test date can't be blank")
      end
      it '試験実施日が今日以降では登録できない' do
        @test.test_date = Faker::Date.forward(days: 14)
        @test.valid?
        expect(@test.errors.full_messages).to include("Test date can't be in the future")
      end
      it '試験カテゴリーが空では登録できない' do
        @test.test_category_id = ''
        @test.valid?
        expect(@test.errors.full_messages).to include('Test category is not a number')
      end
      it '試験カテゴリーが「---」では登録できない' do
        @test.test_category_id = '1'
        @test.valid?
        expect(@test.errors.full_messages).to include('Test category must be other than 1')
      end
      it '試験実施者が空では登録できない' do
        @test.examiner_id = ''
        @test.valid?
        expect(@test.errors.full_messages).to include("Examiner can't be blank")
      end
      it '試験の点数が空では登録できない' do
        @test.result = ''
        @test.valid?
        expect(@test.errors.full_messages).to include("Result can't be blank")
      end
      it '試験の点数が英字では登録できない' do
        @test.result = 'abc'
        @test.valid?
        expect(@test.errors.full_messages).to include("Result is not a number")
      end
      it '試験の点数が-1点では登録できない' do
        @test.result = -1
        @test.valid?
        expect(@test.errors.full_messages).to include("Result must be greater than or equal to 0")
      end
      it '試験の点数が101点では登録できない' do
        @test.result = 101
        @test.valid?
        expect(@test.errors.full_messages).to include("Result must be less than or equal to 100")
      end
    end
  end
end
