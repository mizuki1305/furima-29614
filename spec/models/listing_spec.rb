require 'rails_helper'

RSpec.describe Listing, type: :model do


  before do
    @user = FactoryBot.create(:user)
    @listing = FactoryBot.build(:listing)
  end


describe '商品出品' do
  context '商品出品がうまくいく場合' do
    it "product,text,category_id,state_id,burden_id,area_id,day_id,priceが存在すれば商品出品できる" do
      expect(@listing).to be_valid
    end
  end

  context '商品出品がうまく行かない場合'do
    it "ログインしていないと商品出品ができない" do
    end
    it "puroductが空だと商品出品できない" do
      @listing.product = nil
      @listing.valid?
      expect(@listing.errors.full_messages).to include("Product can't be blank")
    end
    it "textが空だと商品出品できない" do
      @listing.text = nil
      @listing.valid?
      expect(@listing.errors.full_messages).to include("Text can't be blank")
    end
    it "category_idが空だと商品出品できない"do
      @listing.category_id = nil
      @listing.valid?
      expect(@listing.errors.full_messages).to include("Category can't be blank")
    end
    it "category_idがid:1だと商品出品できない" do
      @listing.category_id = "1"
      @listing.valid?
      expect(@listing.errors.full_messages).to include("Category must be other than 1")
    end
    it "state_idが空だと商品出品できない" do
      @listing.state_id = nil
      @listing.valid?
      expect(@listing.errors.full_messages).to include("State can't be blank")
    end
    it "state_idがid:1だと商品出品できない" do
      @listing.state_id = "1"
      @listing.valid?
      expect(@listing.errors.full_messages).to include("State must be other than 1")
    end
    it "burden_idが空だと商品出品できない" do
      @listing.burden_id = nil
      @listing.valid?
      expect(@listing.errors.full_messages).to include("Burden can't be blank")
    end
    it "burden_idがid:1だと商品出品できない" do
      @listing.burden_id = "1"
      @listing.valid?
      expect(@listing.errors.full_messages).to include("Burden must be other than 1")
    end
    it "area_idが空だと商品出品できない" do
      @listing.area_id = nil
      @listing.valid?
      expect(@listing.errors.full_messages).to include("Area can't be blank")
    end
    it "area_idがid:1だと商品出品できない" do
      @listing.area_id = "1"
      @listing.valid?
      expect(@listing.errors.full_messages).to include("Area must be other than 1")
    end
    it "day_idが空だと商品出品できない" do
      @listing.day_id = nil
      @listing.valid?
      expect(@listing.errors.full_messages).to include("Day can't be blank")
    end
    it "day_idがid:1だと商品出品できない" do
      @listing.day_id = "1"
      @listing.valid?
      expect(@listing.errors.full_messages).to include("Day must be other than 1")
    end
    it "priceが空だと商品出品できない" do
      @listing.price = nil
      @listing.valid?
      expect(@listing.errors.full_messages).to include("Price can't be blank")
    end
    it "priceが半角数字のみでないと商品出品できない" do
      @listing.price = "a#あ"
      @listing.valid?
      expect(@listing.errors.full_messages).to include("Price is not a number")
    end
    it "priceが300未満でないと商品出品ができない" do
      @listing.price = 100
      @listing.valid?
      expect(@listing.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "priceが10000000以上だと商品出品ができない" do
      @listing.price = 10000000
      @listing.valid?
      expect(@listing.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
  end
end

end