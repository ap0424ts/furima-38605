require 'rails_helper'

RSpec.describe OrderShipping, type: :model do

  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_shipping = FactoryBot.build(:order_shipping, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_shipping).to be_valid
      end
      it 'buildingは空でも保存できること' do
        building = ''
        expect(@order_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できないこと' do
        @order_shipping.post_code = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Post code can't be blank"
      end
      it 'post_codeが「3桁 - 4桁]の半角文字列でないと保存できないこと' do
        @order_shipping.post_code = '1234567'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Post code is invalid. Include hyphen(-)"
      end
      it 'area_idを選択していないと保存できないこと' do
        @order_shipping.area_id = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Area can't be blank"
      end
      it 'area_idは2~48以外だと保存できないこと' do
        @order_shipping.area_id = '1'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Area can't be blank"
      end
      it 'cityが空だと保存できないこと' do
        @order_shipping.city = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "City can't be blank"
      end
      it 'addresが空だと保存できないこと' do
        @order_shipping.addres = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Addres can't be blank"
      end
      it 'phone_numberが空だと保存できないこと' do
        @order_shipping.phone_number = ''
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberは10桁もしくは11桁の半角数字以外だと保存できないこと' do
        @order_shipping.phone_number = '090-1234-5678'
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Phone number is invalid"
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_shipping.user_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_shipping.item_id = nil
        @order_shipping.valid?
        expect(@order_shipping.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end