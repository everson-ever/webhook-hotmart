class Product < ApplicationRecord
  has_and_belongs_to_many :webhook_urls

  validates :name, :producer_id, :value, presence: true
end
