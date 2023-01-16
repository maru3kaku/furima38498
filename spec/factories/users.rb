FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    name_kana{Faker::Name.name}
    sei{Faker::Name.name}
    sei_kana{Faker::Name.name}
    nickname{"test"}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birthday{Faker::Date.birthday}
    
  end
end