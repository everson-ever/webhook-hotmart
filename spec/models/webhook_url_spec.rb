require 'rails_helper'

RSpec.describe WebhookUrl, type: :model do
  let(:webhook_url) { build(:webhook_url) }

  it { is_expected.to validate_presence_of(:producer_id) }
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_presence_of(:purchase_status) }
  it { is_expected.to validate_presence_of(:producer) }

end
