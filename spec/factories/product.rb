FactoryBot.define do
  factory :product do
    name { 'Product name' }
    producer_id { 1 }
    value { 100 }
  end
end