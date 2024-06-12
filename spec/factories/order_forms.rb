FactoryBot.define do
  factory :order_form do
    postcode { '123-4567'}
    region_id { 2 }
    municipalities { '渋谷区' }
    streetaddress { '1-5-9' }
    buildingname { 'ビル' }
    phonenumber { '09000000000' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end