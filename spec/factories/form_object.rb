FactoryBot.define do
  factory :form_object do
    post_code {'123-4567'}#郵便番号
    prefecture_id {'30'}#都道府県
    city {'横浜市緑区'}#市区町村
    address {'1-1-1'}#番地
    building_name {'やなぎビル'}#建物名(任意)
    telephone_number {'09012345678'}#電話番号


    
    
    #{4 * 12 } #カード番号
    #{ 25 } #カード有効期限（年）
    #{ 12 } #カード有効期限（月）
    #{ 123 } #カードセキュリティコード
    
    
  #   after(:build) do |item|
  #     item.image.attach(io: File.open('public/images/testomu.png'), filename: 'testomu.png')
  # end
end
end