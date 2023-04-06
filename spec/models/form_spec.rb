require 'rails_helper'

RSpec.describe Form, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @form = FactoryBot.build(:form,user_id: user.id,item_id: item.id)
    sleep(1)
  end

  describe '購入機能' do
    context '購入できるとき' do
      it 'ユーザーと商品と住所が存在すれば購入できる' do
        expect(@form).to be_valid
      end
      it '建物名がなくても購入できる' do
        @form.building_name = nil
        expect(@form).to be_valid
      end
    end
  end

    context '購入できないとき' do
      it 'user_idがないと購入できない' do
        @form.user_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idがないと購入できない' do
        @form.item_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号がないと購入できない' do
        @form.post_code = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が3桁-4桁でないと購入できない' do
        @form.post_code = "12-3456"
        @form.valid?
        expect(@form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'delivery_area_idがないと購入できない' do
        @form.delivery_area_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Delivery area can't be blank")
      end
      it '市区町村がないと購入できない' do
        @form.municipality = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地がないと購入できない' do
        @form.address = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号がないと購入できない' do
        @form.room_number = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Room number can't be blank")
      end
      it '電話番号が10桁もしくは11桁でないと購入できない' do
        @form.room_number = "000000000"
        @form.valid?
        expect(@form.errors.full_messages).to include("Room number is invalid")
      end
      it '電話番号が半角数字でないと購入できない' do
        @form.room_number = "１２３４５６７８９１０"
        @form.valid?
        expect(@form.errors.full_messages).to include("Room number is invalid")
      end
    end
end