require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

describe '商品購入' do
  context '商品購入ができないとき' do
   
   it "商品名が必須であること" do
    @item.title= ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
   end
   it "商品説明が必須であること" do
    @item. concept= ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Concept can't be blank")
  end
   it "カテゴリーが必須であること" do
    @item.category_id= ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end
   it "商品の状態が必須であること" do
    @item.status_id= ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Status can't be blank")
  end
   it "配送料の負担が必須であること" do
    @item.delivery_charge_burden_id= ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery charge burden can't be blank")
  end
   it "発送元の地域が必須であること" do
    @item.prefecture_id= ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank")
  end
   it "発送までの日数が必須であること" do
    @item.shipping_day_id= ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping day can't be blank")
  end
   it "価格が必須であること" do
    @item.price= ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end
  it "ユーザーのアソシエーションができている" do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('User must exist')
  end
  end
end  
    context '商品購入ができる時' do
      it '全ての項目が入力されていれば出品ができる' do

        expect(@item).to be_valid

    end
    end
  end
