require 'rails helper'
describe User, type: :model do
  describe  "" do
    it password:  do
      @user.password = 'test1234'
      @user.valid?
      expect(@user.errors.fullmessages).to include("Password Include both letters and numbers")
    end

  end
end