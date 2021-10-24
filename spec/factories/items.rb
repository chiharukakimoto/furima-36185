FactoryBot.define do
  factory :item do
    association :user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
    name { Faker::Name.name }
    item_info {Faker::Lorem.sentence}
    category_id { "2" }
    status_id { "12" }
    delivery_fee_id { "2" }
    prefecture_id { "3" }
    delivery_id { "2" }
    price { 600 }
  end
end
