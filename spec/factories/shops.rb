FactoryGirl.define do
  factory :shop do
    name { FFaker::Company.name }
    association :area, factory: :area
  end
end
