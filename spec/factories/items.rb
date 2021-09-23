FactoryBot.define do
  factory :item do
    name { 'パソコン' }
    introduction { '最近購入したが使わなくなったパソコンです' }
    price { '9999' }
    category_id { '2' }
    item_condition_id { '2' }
    prefecture_id { '2' }
    delivery_cost_id { '2' }
    days_to_ship_id { '2' }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
