FactoryBot.define do
  factory :order do
    price {3000}
    title { 'オム' } # 商品名
    price { 10000 } # 価格
    delivery_charge_burden_id { 2 } # 配送料の負担
    {4 * 12 } #カード番号
    { 25 } #カード有効期限（年）
    { 12 } #カード有効期限（月）
    { 123 } #カードセキュリティコード
    
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/testomu.png'), filename: 'testomu.png')
  end
end
