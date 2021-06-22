FactoryBot.define do
  factory :webhook_url do
    producer_id { 1 }
    url { 'http://localhost:3333/webhook' }
  end
end