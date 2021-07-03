require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validate_presence_of(:password) }
  it { is_expected.to respond_to(:client) }
  it { is_expected.to respond_to(:producer) }
  it { is_expected.to respond_to(:balance) }
  it { is_expected.to validate_confirmation_of(:password) }
end
