require 'rails_helper'

RSpec.describe Balance, type: :model do
  let(:balance) { build(:balance) }

  it { is_expected.to validate_presence_of(:user_id) }
end
