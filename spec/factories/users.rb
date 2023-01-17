FactoryBot.define do
  factory :user do
    name {"山田"}
    name_kana{Faker::Name.name}
    sei{"太郎"}
    sei_kana{Faker::Name.name}
    nickname{"test"}
    email {Faker::Internet.free_email}
    password {"qwert3"}
    password_confirmation {password}
    birthday{Faker::Date.birthday}
    
  end
end