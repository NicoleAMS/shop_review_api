FactoryGirl.define do
  factory :review do
    name { FFaker::Lorem.sentence }
    association :shop, factory: :shop
  end
end
