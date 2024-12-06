require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'nicknameとemail、password、password_confirmation、surname_in_kanji、first_name_in_kanji、surname_in_kana、first_name_in_kanaとdate_of_birthが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameがからでは登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailがすでに登録済みの場合は登録できない' do
        existing_user = FactoryBot.create(:user, email: 'test@example.com')
        @user.email = 'test@example.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailが@抜きでは登録できない' do
        @user.email = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a1234'
        @user.password_confirmation = 'a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'a12345'
        @user.password_confirmation = 'a123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角数値のみの場合登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが半角英字のみの場合登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが半角英数字以外が含まれている場合登録できない' do
        @user.password = '!a1234'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'surname_in_kanjiがからでは登録できない' do
        @user.surname_in_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname in kanji can't be blank")
      end
      it 'surname_in_kanjiが半角では登録できない' do
        @user.surname_in_kanji = 'ﾊﾝｶｸ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Surname in kanji is invalid')
      end
      it 'first_name_in_kanjiがからでは登録できない' do
        @user.first_name_in_kanji = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name in kanji can't be blank")
      end
      it 'first_name_in_kanjiが半角では登録できない' do
        @user.first_name_in_kanji = 'ﾊﾝｶｸ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name in kanji is invalid')
      end
      it 'surname_in_kanaがからでは登録できない' do
        @user.surname_in_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Surname in kana can't be blank")
      end
      it 'surname_in_kanaが半角では登録できない' do
        @user.surname_in_kana = 'ﾊﾝｶｸ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Surname in kana is invalid')
      end
      it 'first_name_in_kanaがからでは登録できない' do
        @user.first_name_in_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name in kana can't be blank")
      end
      it 'first_name_in_kanaが半角では登録できない' do
        @user.first_name_in_kana = 'ﾊﾝｶｸ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name in kana is invalid')
      end
      it 'date_of_birthがからでは登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end
