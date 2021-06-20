class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :producer
  has_one :client

  after_create :create_client, :create_producer

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
end
