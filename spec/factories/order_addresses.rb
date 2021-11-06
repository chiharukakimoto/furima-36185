FactoryBot.define do
  factory :order_address do
    post_cord { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    house_number { '1-1' }
    building_name { '東京ハイツ' }
    phone { '08012345678' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
