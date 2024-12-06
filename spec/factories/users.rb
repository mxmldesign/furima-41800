FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    surname_in_kanji { '山田' }
    first_name_in_kanji { '太郎' }
    surname_in_kana { 'ヤマダ' }
    first_name_in_kana { 'タロウ' }
    date_of_birth { '1988-01-01' }
  end
end
