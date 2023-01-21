FactoryBot.define do
  factory :item do

      image {"100174297-7e01e380-2f0f-11eb-8e68-bd07ea193dd1.png"}
      title{"オムライス"}#商品名
      concept{"いいね"}#商品の説明
      category_id{1}#カテゴリー
      status_id{1}#商品状態
      delivery_charge_burden_id{1}#配送料の負担
      prefecture_id {1}#発送元の地域
      shipping_day_id {1}#発送までの日数
      price{10000}#価格
      
      after(:build) do |message|
        message.image.attach(io: File.open('images/testomu.png'), filename: 'testomu.png')
      end
  end
end
