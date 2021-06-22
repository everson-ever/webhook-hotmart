require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { build(:product) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:producer_id) }
  it { is_expected.to validate_presence_of(:value) }
end