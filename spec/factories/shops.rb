FactoryGirl.define do
  factory :shop do
    name { FFaker::Company.name }
  end
end