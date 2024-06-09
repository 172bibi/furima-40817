FactoryBot.define do
  factory :item do
    item { Faker::Lorem.word }
    explanation { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    situation_id { Faker::Number.between(from: 2, to: 7) }
    deliverycharge_id { Faker::Number.between(from: 2, to: 3) }
    region_id { Faker::Number.between(from: 2, to: 48) }
    deliveryday_id { Faker::Number.between(from: 2, to: 4) }
    price { Faker::Number.between(from: 300, to: 9999999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
