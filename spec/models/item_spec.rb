require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

describe '商品出品' do
  context '商品出品ができないとき' do
   it "商品名が必須であること" do
    @item.title= ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
   end
   it "商品説明が必須であること" do
    @item.concept= ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Concept can't be blank")
  end
   it "カテゴリーが必須であること" do
    @item.category_id= ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end
  it "カテゴリーidが1ではない" do
    @item.category_id= 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Category can't be blank")
  end
   it "商品の状態が必須であること" do
    @item.status_id= ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Status can't be blank")
  end
  it "商品状態idが1ではない" do
    @item.status_id= 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Status can't be blank")
  end
   it "配送料の負担が必須であること" do
    @item.delivery_charge_burden_id= ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery charge burden can't be blank")
  end
  it "配送料の負担idが1ではない" do
    @item.delivery_charge_burden_id= 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Delivery charge burden can't be blank")
  end
   it "発送元の地域が必須であること" do
    @item.prefecture_id= ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank")
  end
  it "配送元の地域idが0ではない" do
    @item.prefecture_id= 0
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture can't be blank")
  end
   it "発送までの日数が必須であること" do
    @item.shipping_day_id= ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping day can't be blank")
  end
  it "発送までの日数idが1ではない" do
    @item.shipping_day_id= 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping day can't be blank")
  end
   it "価格が必須であること" do
    @item.price= ''
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
  end
  it "価格が半角数字であること" do
    @item.price= '１０００' 
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is invalid")
  end
  it "価格が300円以上であること" do
    @item.price = 299
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is invalid")
  end
  it "価格が9999999以下であること" do
    @item.price =10000000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price is invalid")
  end
  it "ユーザーのアソシエーションができている" do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include('User must exist')
  end
  it "商品画像が空では出品出来ない" do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("Image can't be blank")
  end
  end
end  
    context '商品出品ができる時' do
      it '全ての項目が入力されていれば出品ができる' do
        expect(@item).to be_valid

    end
    end
  end
