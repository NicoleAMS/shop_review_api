FactoryGirl.define do
  factory :review do
    name { FFaker::Lorem.sentence }
  end
end