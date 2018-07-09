require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:review) { FactoryGirl.build :review }
  subject { review }

  it { should respond_to(:name) }
  it { should validate_presence_of(:name) }

  it { should respond_to(:shop_id) }
  it { should validate_presence_of(:shop_id) }
  it { should belong_to :shop }
  it { should have_many :scores }
end
