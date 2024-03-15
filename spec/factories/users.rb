
FactoryBot.define do
  factory :user do
  nickname { Faker::Name.last_name }
  email { Faker::Internet.email }
  password { '3q' + Faker::Internet.password(min_length: 6) }
  password_confirmation { password }
  first_name { '太郎' }
  last_name { '山田' }
  first_name_kana { 'タロウ' }
  last_name_kana { 'ヤマダ' }
  birthday { Date.new(1990, 1, 1) }
  end
end