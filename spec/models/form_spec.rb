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

    context '購入できないとき' do
      it 'user_idがないと購入できない' do
        @form.user_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idがないと購入できない' do
        @form.item_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("Itemを入力してください")
      end
      it '郵便番号がないと購入できない' do
        @form.post_code = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("郵便番号を入力してください")
      end
      it '郵便番号が3桁-4桁でないと購入できない' do
        @form.post_code = "12-3456"
        @form.valid?
        expect(@form.errors.full_messages).to include("郵便番号is invalid. Include hyphen(-)")
      end
      it 'delivery_area_idがないと購入できない' do
        @form.delivery_area_id = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'delivery_area_idが---のとき購入できない' do
        @form.delivery_area_id = 1
        @form.valid?
        expect(@form.errors.full_messages).to include("都道府県can't be blank")
      end
      it '市区町村がないと購入できない' do
        @form.municipality = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("市区町村を入力してください")
      end
      it '番地がないと購入できない' do
        @form.address = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("番地を入力してください")
      end
      it '電話番号がないと購入できない' do
        @form.room_number = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("電話番号を入力してください")
      end
      it '電話番号が9桁以下だと購入できない' do
        @form.room_number = "000000000"
        @form.valid?
        expect(@form.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が12桁以上だと購入できない' do
        @form.room_number = "000000000000"
        @form.valid?
        expect(@form.errors.full_messages).to include("電話番号は不正な値です")
      end
      it '電話番号が半角数字でないと購入できない' do
        @form.room_number = "１２３４５６７８９１０"
        @form.valid?
        expect(@form.errors.full_messages).to include("電話番号は不正な値です")
      end
      it "tokenが空では購入できない" do
        @form.token = nil
        @form.valid?
        expect(@form.errors.full_messages).to include("カード情報を入力してください")
      end
    end
  end
end