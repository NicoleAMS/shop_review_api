FactoryGirl.define do
  factory :area do
    name { FFaker::AddressUK.neighborhood }
  end
end