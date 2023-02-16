FactoryBot.define do
  factory :item do
    title { 'オム' } # 商品名
    concept { 'いいね' } # 商品の説明
    category_id { 2 } # カテゴリー
    status_id { 2 } # 商品状態
    delivery_charge_burden_id { 2 } # 配送料の負担
    prefecture_id { 2 } # 発送元の地域
    shipping_day_id { 2 } # 発送までの日数
    price { 10_000 } # 価格

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/testomu.png'), filename: 'testomu.png')
    end
  end
end
