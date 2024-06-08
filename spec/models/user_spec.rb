require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it '正常に登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'a1a1a1'
        @user.password_confirmation = 'a1a1a1'
        expect(@user).to be_valid
      end
      it 'lastnameとfirstnameが全角であれば登録できる' do
        @user.lastname = '田中'
        @user.firstname = '太郎'
        expect(@user).to be_valid
      end
      it 'lastnamekanaとfirstnamekanaが全角であれば登録できる' do
        @user.lastnamekana = 'タナカ'
        @user.firstnamekana = 'タロウ'
        expect(@user).to be_valid
      end
    end
    context '新規登録出来ない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが数字だけだと登録できない' do
        @user.password ='111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが英字だけだと登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordが全角だと登録できない' do
        @user.password = 'ああああああ'
        @user.password_confirmation = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'passwordとconfirmが一致していないと登録できない' do
        @user.password = 'a1a1a1'
        @user.password_confirmation ='a1a1a1a1'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが英数字混合でも6文字未満なら登録できない' do
        @user.password ='a1a1a'
        @user.password_confirmation = 'a1a1a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailには@が含まれていないと登録できない' do
        @user.email = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'lastnameが空では登録できない' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank", "Lastname is invalid")
      end
      it 'lastnameが半角では登録できない' do
        @user.lastname = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname is invalid")
      end
      it 'firstnameが空では登録できない' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank", "Firstname is invalid")
      end
      it 'firstnameが半角では登録できない' do
        @user.firstname = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname is invalid")
      end
      it 'lastnamekanaが空では登録できない' do
        @user.lastnamekana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastnamekana can't be blank", "Lastnamekana is invalid")
      end
      it 'lastnamekanaが半角では登録できない' do
        @user.lastnamekana = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastnamekana is invalid")
      end
      it 'firstnamekanaが空では登録できない' do
        @user.firstnamekana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstnamekana can't be blank", "Firstnamekana is invalid")
      end
      it 'firstnamekanaが半角では登録できない' do
        @user.firstnamekana = 'aa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstnamekana is invalid")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end