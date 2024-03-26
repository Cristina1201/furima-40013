require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_buyer = FactoryBot.build(:order_buyer, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  
  describe '商品購入機能' do
    context '商品が購入できるとき' do
      it 'すべての入力項目が揃っていれば購入できる' do
        expect(@order_buyer).to be_valid
      end
      it '建物名は空でも購入できる' do
        @order_buyer.building_name = ''
        expect(@order_buyer).to be_valid
      end
    end

    context '商品が購入できないとき' do
      it 'post_codeが空では購入できない' do
        @order_buyer.post_code = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Post code can't be blank")
      end
      
      it 'post_codeは半角数字でないと購入できない' do
        @order_buyer.post_code = 'ゼンカク'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Post code should be in the format of '3 digits - 4 digits'")
      end
      
      it 'post_codeは-を含まないと登録できない' do
        @order_buyer.post_code = '12345678'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Post code should be in the format of '3 digits - 4 digits'")
      end
      
      it 'Prefectureが初期値では購入できない' do
        @order_buyer.prefecture_id = 1
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では購入できない' do
        @order_buyer.city = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では購入できない' do
        @order_buyer.address = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では購入できない' do
        @order_buyer.phone_number = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberは-を含むと登録できない' do
        @order_buyer.phone_number = '090-1234-5678'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number should be 10 or 11 digits")
      end

      it "phone_numberが9ケタ以下では購入できない" do
        @order_buyer.phone_number = '12345678'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number should be 10 or 11 digits")
      end

      it "phone_numberが12ケタ以上では購入できない" do
        @order_buyer.phone_number = '123456789012'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number should be 10 or 11 digits")
      end

      it 'user_idが空では購入できない' do
        @order_buyer.user_id = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @order_buyer.item_id = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では購入できない' do
        @order_buyer.token = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Token can't be blank")
      end
    end
    
  end
end
