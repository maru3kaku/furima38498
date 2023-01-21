require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

describe '商品購入' do
  context '商品購入ができないとき' do
   it "" do
   end
  end

  
  
    context '商品購入ができる時' do
      it '全ての項目が入力されていれば購入ができる' do
        expect(@item).to be_valid
    end
    end
  end
end
