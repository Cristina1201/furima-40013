FactoryBot.define do
  factory :order_buyer do
    post_code {Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s}
    prefecture_id {Faker::Number.between(from: 2, to: 48)}
    city {Faker::Address.city}
    address {Faker::Address.street_address}
    building_name {Faker::Address.street_address}
    phone_number {Faker::Number.number(digits: rand(10..11)).to_s}
    token {"tok_abcdefghijk00000000000000000"}
  end
end