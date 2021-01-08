require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "新規登録/ユーザー情報" do
    it "全ての情報があれば登録できる"do
      expect(@user).to be_valid
    end
    it "ニックネームがないと登録できない"do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it "メールアドレスがないと登録できない"do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include"Email can't be blank"
    end

    it "既に登録されているメールアドレスでは登録できない"do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "＠を含まないメールアドレスでは登録できない"do
      @user.email = "aaaaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include"Email is invalid"
    end

    it "パスワードがないと登録できない"do
      @user.password = ""
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "パスワードが６文字未満では登録できない"do
      @user.password = "abc12"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it "パスワードが半角英字のみでは登録できない"do
      @user.password = "abcdef"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it "パスワードが半角数字のみでは登録できない"do
      @user.password = "123456"
      @user.password_confirmation = @user.password
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end

    it "パスワード（確認用）がないと登録できない"do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it "パスワードとパスワード（確認用）が一致しないと登録できない"do
      @user.password = "abc12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

  end

  describe "新規登録/本人情報確認" do
    it "ユーザー本名の名字がないと登録できない"do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "ユーザー本名の名前がないと登録できない"do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "ユーザー本名の名字と名前がないと登録できない"do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "ユーザー本名の名字が全角でないと登録できない"do
      @user.family_name = "kashino"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
    end
    it "ユーザー本名の名前が全角でないと登録できない"do
      @user.first_name = "ayano"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end
    it "ユーザー本名が全角でないと登録できない"do
      @user.family_name = "nishiwaki"
      @user.family_name = "sayaka"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
    end
    it "ユーザー本名のフリガナ(名字)がないと登録できない"do
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "ユーザー本名のフリガナ(名前)がないと登録できない"do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "生年月日がないと登録できない"do
      @user.birthday_id = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end

