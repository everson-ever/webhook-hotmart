# The user class manage the users of system
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :producer
  has_one :client
  has_one :balance

  after_create :create_client, :create_producer, :create_balance

  validates :name, presence: true

  def create_client
    client = Client.new
    client.user_id = self.id
    client.save
  end

  def create_producer
    producer = Producer.new
    producer.user_id = self.id
    producer.save
  end

  def create_balance
    balance = Balance.new
    balance.user_id = self.id
    balance.save
  end
end
