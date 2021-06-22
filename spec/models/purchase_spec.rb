require 'rails_helper'

RSpec.describe Purchase, type: :model do
  let(:purchase) { build(:purchase) }

  it { is_expected.to validate_presence_of(:product_id) }
  it { is_expected.to validate_presence_of(:client_id) }
  it { is_expected.to validate_presence_of(:purchase_status_id) }
  it { is_expected.to validate_presence_of(:order_date) }
  it { is_expected.to validate_presence_of(:value) }
  it { is_expected.to validate_presence_of(:quantity) }
end