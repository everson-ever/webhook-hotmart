class Client < ApplicationRecord
  belongs_to :user
  has_many :purchases

  validates :user_id, presence: true
end
