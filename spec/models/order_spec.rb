require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  context '内容に問題ない場合' do
    
    it "" do
      
    end
    
  end

  context '内容に問題がある場合' do
    it "priceが空では保存ができないこと" do
      @order.price = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Price can't be blank")
    end
    it "郵便番号が必須であること。" do
      
    end
    it "郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと" do
      
    end
    it "都道府県が必須であること。" do
      
    end
    it "市区町村が必須であること。" do
      
    end
    it "番地が必須であること。" do
      
    end
    it "建物名は任意であること。" do
      
    end
    it "電話番号が必須であること。" do
      
    end
    it "電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと" do
      
    end
  end

end
