require 'rails_helper'

RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email,password,password_confirmation,family_name,first_name,family_name_ruby,first_name_ruby,birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
        # binding.pry
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
      end
      it "emailが空だと登録できない" do
      end
      it "emailに@が存在しないと登録できない"do
      end
      it "passwordが空だと登録できない" do
      end
      it "passwordが5文字以下だと登録できない" do
      end
      it "pwsswordが存在してもencrypted_passwordが空では登録できない" do
      end
      it "birthdayが空だと登録できない" do
      end
    end
  end
end
end