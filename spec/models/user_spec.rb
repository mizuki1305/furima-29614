require 'rails_helper'

RSpec.describe User, type: :model do

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email,password,password_confirmation,family_name,first_name,family_name_ruby,first_name_ruby,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailが一意性でないと登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")  
      end
      it "emailに＠がないと登録できない" do
        @user.email = "#$%&"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空だと登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordとpassword_confirmationが不一致では登録できないこと" do
        @user.password = "123456"
        @user.password_confirmation = "1234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "family_nameが全角（漢字・ひらがな・カタカナ）以外は登録できない" do
        @user.family_name = "1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name is invalid")
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）以外は登録できない" do
        @user.first_name = "1234"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it "family_name_rubyが全角（カタカナ）以外は登録できない" do
        @user.family_name_ruby = "ひらがな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name ruby is invalid")
      end
      it "first_name_rubyが全角（カタカナ）以外は登録できない" do
        @user.first_name_ruby = "ひらがな"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby is invalid")
      end
      it "family_nameが空だと登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "family_name_rubyが空だと登録できない" do
        @user.family_name_ruby = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name ruby can't be blank")
      end
      it "first_name_rubyが空だと登録できない" do
        @user.first_name_ruby = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name ruby can't be blank")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
end