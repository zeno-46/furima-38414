require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
  
  describe "ユーザー新規登録" do
    context '新規登録ができるとき' do
      it "必須項目が全てあれば登録できる" do
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上の半角英数字であれば登録できる' do
        @user.password = 'a123456'
        @user.password_confirmation = 'a123456'
        expect(@user).to be_valid
      end
    end

  context '新規登録ができないとき' do
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it '重複したEメールが存在すると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include"Email has already been taken"
    end

    it 'Eメールに@が含まれていないとユーザー登録できない' do
      @user.email = 'abcdmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include"Email is invalid"
    end

    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank", "Password confirmation doesn't match Password"
    end

    it 'passwordが5文字以下であれば登録できない' do
      @user.password = 'a1234'
      @user.password_confirmation = 'a1234'
      @user.valid?
      expect(@user.errors.full_messages).to include"Password is too short (minimum is 6 characters)"
    end

    it 'passwordが半角英字のみだとユーザー登録できない' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include
    end

    it 'passwordが全角文字を含むと登録できない' do
      @user.password = 'Ａ123456'
      @user.password_confirmation = 'Ａ123456'
      @user.valid?
      expect(@user.errors.full_messages).to include
    end

    it 'passwordとpassword_confirmationが不一致では登録できない' do
      @user.password = 'a123456'
      @user.password_confirmation = 'b123456'
      @user.valid?
      expect(@user.errors.full_messages).to include"Password confirmation doesn't match Password"
    end

    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end

    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end

    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end

    it 'last_nameが全角（漢字・ひらがな・カタカナ）以外だとユーザー登録できない' do
      @user.first_name = 'フリマ'
      @user.valid?
      expect(@user.errors.full_messages).to include
    end

    it 'first_nameが全角（漢字・ひらがな・カタカナ）以外だとユーザー登録できない' do
      @user.first_name = 'フリマ'
      @user.valid?
      expect(@user.errors.full_messages).to include
    end

    it 'last_name_kanaが全角（カタカナ）以外だとユーザー登録できないこと' do
      @user.last_name_kana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include
    end

    it 'first_name_kanaが全角（カタカナ）以外だとユーザー登録できないこと' do
      @user.first_name_kana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end
  end
  end
  end
end
