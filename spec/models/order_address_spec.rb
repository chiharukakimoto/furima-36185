require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe 'オーダー情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @order_address.building_name = ""
        expect(@order_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_cordが空だと保存できないこと' do
        @order_address.post_cord = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post cord can't be blank"
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @order_address.post_cord = "1234567"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post cord is invalid. Include hyphen(-)"
      end
      it 'prefectureを選択していないと保存できないこと' do
        @order_address.prefecture_id = 0
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'cityが空だと保存できないこと' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "City can't be blank"
      end
      it 'house_numberが空だと保存できないこと' do
        @order_address.house_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "House number can't be blank"
      end
      it 'phoneが空だと保存できないこと' do
        @order_address.phone = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone can't be blank"
      end
      it 'phoneが10桁以上の半角数字でないと保存できないこと' do
        @order_address.phone = "080123456"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone is invalid"
      end
      it 'phoneが11桁以下の半角数字でないと保存できないこと' do
        @order_address.phone = "080123456789"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone is invalid"
      end
      it 'userが紐付いていないと保存できないこと' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end
      it 'itemが紐付いていないと保存できないこと' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end
    end
  end
end
