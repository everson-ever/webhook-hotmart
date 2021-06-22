FactoryBot.define do
  factory :purchase do
    product_id { 1 }
    client_id { 1 }
    purchase_status_id { 1 }
    order_date { Faker::Date.in_date_period }
    value { 100 }
    quantity { 1 }
  end
end