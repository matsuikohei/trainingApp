require 'rails_helper'

RSpec.describe User, type: :model do
before do
  @user = FactoryBot.build(:user)
end

  describe 'ユーザー新規登録' do
    context '登録できる' do
      it '必要な情報を入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '登録できない' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end      
      it 'emailに@が含まれていなければ登録できない' do
        @user.email = 'testgmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end      
      it '重複したemailでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")        
      end      
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")        
      end      
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")        
      end      
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")        
      end      
      it 'employee_numberが空では登録できない' do
        @user.employee_number = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Employee number can't be blank")        
      end      
      it '重複したemployee_numberでは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, employee_number: @user.employee_number)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Employee number has already been taken")
      end      
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")        
      end      
      it 'last_nameに数字が使用されていると登録できない' do
        @user.last_name = 'lastname1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")        
      end      
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end      
      it 'first_nameに数字が使用されていると登録できない' do
        @user.first_name = 'firstname1'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end      
    end
  end
end
