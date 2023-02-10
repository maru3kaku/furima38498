require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
  describe '商品購入' do
  context '全ての項目が入力されていれば商品購入ができる' do
      expect(@order).to be_valid
    end
    
  end

  context '内容に問題がある場合' do
    it "priceが空では保存ができないこと" do
      @order.price = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Price can't be blank")
    end
    it "郵便番号が必須であること。" do
      @order.post_code = ''
      @order.valid?
      expect(@order.errors.full_messages).to include(" can't be blank")

    end
    it "郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと" do
      @order.post_code =
      @order.valid?
      expect(@order.errors.full_messages).to include(" can't be blank")

    end
    it "都道府県が必須であること。" do
      @order.prefecture_id = ''
      @order.valid?
      expect(@order.errors.full_messages).to include(" can't be blank")

    end
    it "市区町村が必須であること。" do
      @order.city = ''
      @order.valid?
      expect(@order.errors.full_messages).to include(" can't be blank")
      
    end
    it "番地が必須であること。" do
      @order.address = ''
      @order.valid?
      expect(@order.errors.full_messages).to include(" can't be blank")
      
    end
    it "建物名は任意であること。" do
      @order.building_name
      @order.valid?
      expect(@order.errors.full_messages).to include(" can't be blank")
      
    end
    it "電話番号が必須であること。" do
      @order.telephone_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include(" can't be blank")
      
    end
    it "電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと" do
      @order.telephone_number = ''
      @order.valid?
      expect(@order.errors.full_messages).to include(" can't be blank")
      
    end
  end

end
