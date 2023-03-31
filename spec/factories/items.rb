FactoryBot.define do
  factory :item do
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    item_name                  { 'test' }
    description                { 'test' }
    category_id                { 2 }
    status_id                  { 2 }
    shipping_charge_id         { 2 }
    delivery_area_id           { 2 }
    estimated_delivery_date_id { 2 }
    price                      { 300 }
    # user_id                    { 1 }
  end
end
