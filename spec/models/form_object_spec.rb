require 'rails_helper'

RSpec.describe FormObject, type: :model do
  before do
    @order = FactoryBot.build(:form_object)
  end

  describe '商品購入' do
    context '購入できないとき' do
      it '郵便番号が必須であること。' do
        @order.post_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
        @order.post_code = '12-34567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Post code is invalid.')
      end
      it '都道府県が必須であること。' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が必須であること。' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が必須であること。' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が必須であること。' do
        @order.telephone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号は、10桁未満では登録できない' do
        @order.telephone_number = '123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号は、12桁以上では登録できない' do
        @order.telephone_number = '12345678900000'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone number is invalid')
      end
      it '電話番号に全角文字含むと登録できない' do
        @order.telephone_number = '１２３４５６７８９０'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone number is invalid')
      end
      it 'user_idが空では購入できない' do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では登録できないこと' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
    end

    context '商品購入ができる時' do
      it '全ての項目が入力されていれば購入できる' do
        expect(@order).to be_valid
      end
      it '建物名は空でも購入できる' do
        @order.building_name = ''
        expect(@order).to be_valid
      end

    end
  end
end
