class Balance < ApplicationRecord

  validates :user_id, presence: true
end
