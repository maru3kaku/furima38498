FactoryBot.define do
  factory :delivery do
    post_code { 123-4567 } #郵便番号
    prefecture_id{ 4 } #都道府県
    city{ 横浜市緑区 } #市区町村
    address{ ７丁目１番地} #番地
    telephone_number{ 090-1234-5678 } #電話番号
    
    
    end
  end
end
