FactoryGirl.define do
  factory :score do
    name { FFaker::Lorem.sentence }
    value { rand(1..5) }
    association :review, factory: :review
  end
end