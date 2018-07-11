require 'rails_helper'

RSpec.describe Score, type: :model do

  let(:score) { FactoryGirl.build :score }
  subject { score }

  it { should respond_to(:name) }
  it { should respond_to(:value) }

  it { should respond_to(:review_id) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:value) }
  it { should validate_numericality_of(:value).is_greater_than_or_equal_to(1) }
  it { should validate_numericality_of(:value).is_less_than_or_equal_to(5) }
  it { should validate_presence_of(:review) }

  it { should belong_to :review }

end
