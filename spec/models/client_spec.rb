require 'rails_helper'

RSpec.describe Client, type: :model do
  let(:client) { build(:client) }

  it { is_expected.to validate_presence_of(:user_id) }
end