class Purchase < ApplicationRecord
  belongs_to :client
  belongs_to :product
  belongs_to :purchase_status

  validates :product_id, :client_id, :purchase_status_id, :order_date, :value, :quantity, presence: true
end
