class WebhookUrl < ApplicationRecord
  belongs_to :producer
  has_and_belongs_to_many :products
  has_and_belongs_to_many :purchase_status

  validates :producer_id, :url, presence: true
end
