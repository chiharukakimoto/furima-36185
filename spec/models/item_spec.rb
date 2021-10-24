require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe 'アイテム新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての項目が入力されていれば登録できる" do
        expect(@item).to be_valid
      end
    end
    
    context '新規登録がうまくいかないとき' do
      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it "nameが空だと登録できない" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Name can't be blank"
      end
      it "item_infoが空では登録できない" do
        @item.item_info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Item info can't be blank"
      end
      it "categoryが空では登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it "statusが空では登録できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Status can't be blank"
      end
      it "delivery_feeが空では登録できない" do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery fee can't be blank"
      end
      it "prefectureが空では登録できない" do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank"
      end
      it "deliveryが空では登録できない" do
        @item.delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include "Delivery can't be blank"
      end
      it "priceが300-9999999の間でないと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
      it "priceが半角数字でないと登録できない" do
        @item.price = "６００"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
      it "価格が空では出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end
      it "価格が9_999_999円を超えると出品できない" do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
      it "userが紐付いていなければ出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end