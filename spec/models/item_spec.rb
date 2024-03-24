require 'rails_helper'

RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品する' do
    context '出品できる場合' do
      
      it "すべての項目が適切に入力されていれば出品できる" do
      expect(@item).to be_valid
      end
    end

    context '出品できない場合' do

      it "userが紐づいていないと登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end

      it "item_nameが空だと保存できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it "item_descriptionが空だと保存できない" do
        @item.item_description =  ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end

      it "imageが空だと保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "categoryが空だと保存できない" do
        @item.category = nil  
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "conditonが空だと保存できない" do
        @item.condition = nil  
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it "postageが空だと保存できない" do
        @item.postage = nil  
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end

      it "prefectureが空だと保存できない" do
        @item.prefecture = nil  
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "shipping_dayが空だと保存できない" do
        @item.shipping_day = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it "priceが空だと保存できない" do
        @item.price =  ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceに半角数字以外が含まれている場合は出品できない" do
        @item.price = 'ww22'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it "priceが299円以下だと出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be in 300..9999999")
      end

      it "priceが10,000,000円以上だと出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be in 300..9999999")
      end

      it 'categoryが「---」を選択した状態だと保存できない' do
        @item.category_id = Category.find_by(name: '---').id
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "conditonが「---」を選択した状態だと保存できない" do
        @item.condition_id = Condition.find_by(name: '---').id 
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it "postageが「---」を選択した状態だと保存できない" do
        @item.postage_id  = Postage.find_by(name: '---').id 
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end

      it "prefectureが「---」を選択した状態だと保存できない" do
        @item.prefecture_id = Prefecture.find_by(name: '---').id 
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "shipping_dayが空だと保存できない" do
        @item.shipping_day_id = ShippingDay.find_by(name: '---').id 
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
    end
  end

end
