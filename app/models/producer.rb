class Producer < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :webhook_urls
end
