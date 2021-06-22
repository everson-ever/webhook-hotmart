require 'rails_helper'

RSpec.describe PurchaseStatus, type: :model do
  let(:purchase_status) { build(:purchase_status) }

  it { is_expected.to validate_presence_of(:label) }
end