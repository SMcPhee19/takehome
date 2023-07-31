FactoryBot.define do
  factory :subscription do
    association :customer
    association :tea
    title { Faker::Tea.variety }
    price { Faker::Number.between(from: 1, to: 20) }
    status { 'active'}
    frequency { 'monthly'}
  end
end