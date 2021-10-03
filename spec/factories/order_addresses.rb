FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id { '3' }
    city { '東京都' }
    house_number { '1-1' }
    building_number { '東京ハイツ' }
    telephone_number { '09035468695' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
