class WebhookUrl < ApplicationRecord
  belongs_to :producer
  has_and_belongs_to_many :products
  has_and_belongs_to_many :purchase_status, :foreign_key => :purchases_status_id
end
