require 'rails_helper'

RSpec.describe Area, type: :model do
  let(:area) { FactoryGirl.build :area }
  subject { area }

  it { should respond_to(:name) }
  it { should validate_presence_of(:name) }

  it { should have_many :shops }
  it { should have_many :reviews }
  it { should have_many :scores }
end
