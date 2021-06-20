class PurchaseStatus < ApplicationRecord
  self.table_name = "purchase_status"

  validates :label, presence: true
  validates :label, uniqueness: true
end
