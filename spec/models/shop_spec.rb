require 'rails_helper'

RSpec.describe Shop, type: :model do
  let(:shop) { FactoryGirl.build :shop }
  subject { shop }

  it { should respond_to(:name) }
  it { should validate_presence_of(:name) }

  it { should respond_to(:area_id) }
  it { should validate_presence_of(:area) }
  it { should belong_to :area }

  it { should have_many :reviews }
  it { should have_many :scores }
end
