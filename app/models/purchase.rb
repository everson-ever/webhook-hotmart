class Purchase < ApplicationRecord
  belongs_to :client
  belongs_to :product
  belongs_to :purchase_status
end
