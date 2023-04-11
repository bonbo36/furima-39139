require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'すべての項目の入力が存在すれば保存できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'password_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが半角数字のみのとき登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは有効ではありません。')
      end
      it 'passwordが半角英語のみのとき登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは有効ではありません。')
      end
      it 'passwordが全角のとき登録できない' do
        @user.password = '１２３４５６'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは有効ではありません。')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First nameは全角(漢字・ひらがな・カタカナ)で入力して下さい。")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last nameは全角(漢字・ひらがな・カタカナ)で入力して下さい。")
      end
      it 'first_nameに半角が入っているとき登録できない' do
        @user.first_name = 'ｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First nameは全角(漢字・ひらがな・カタカナ)で入力して下さい。')
      end
      it 'last_nameに半角が入っているとき登録できない' do
        @user.last_name = 'ｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last nameは全角(漢字・ひらがな・カタカナ)で入力して下さい。')
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanaを入力してください")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanaを入力してください")
      end
      it 'first_name_kanaが全角カタカナで入力されてないと登録できない' do
        @user.first_name_kana = 'ｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kanaは全角カタカナで入力して下さい。')
      end
      it 'last_name_kanaが全角カタカナで入力されてないと登録できない' do
        @user.last_name_kana = 'ｶﾅ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kanaは全角カタカナで入力して下さい。')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthdayを入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it '重複するemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールは不正な値です')
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length: 129)
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは128文字以内で入力してください')
      end
    end
  end
end
