class Client < ApplicationRecord
  belongs_to :user

  validates :user_id, :phone, :age, presence: true
end
