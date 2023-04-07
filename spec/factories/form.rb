FactoryBot.define do
  factory :form do

    post_code         { "123-4567" }
    delivery_area_id  { 2 }
    municipality      { "横浜市"}
    address           { "青山1-1-1" }
    building_name     { "柳ビル" }
    room_number       { "00000000000" }
    token {"tok_abcdefghijk00000000000000000"}
    
  end
end