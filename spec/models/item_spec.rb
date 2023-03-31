require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

describe '商品出品機能' do
  context '商品出品できるとき' do
    it 'すべての項目の入力が存在すれば保存できる' do
      expect(@item).to be_valid
    end
  end

  context '商品出品できないとき' do
    it '画像が空だと保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空だと保存できない' do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it '商品の説明が空だと保存できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリーが空だと保存できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it '商品の状態が空だと保存できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank")
    end
    it '配送料の負担が空だと保存できない' do
      @item.shipping_charge_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
    end
    it '発送元の地域が空だと保存できない' do
      @item.delivery_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery area can't be blank")
    end
    it '発送までの日数が空だと保存できない' do
      @item.estimated_delivery_date_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Estimated delivery date can't be blank")
    end
    it '販売価格が空だと保存できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '販売価格が¥300未満のとき保存できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '販売価格が¥9,999,999より大きいと保存できない' do
      @item.price = 1000000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it '販売価格が半角数字以外のとき登録できない' do
      @item.price = 'aaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
  end
end
end
