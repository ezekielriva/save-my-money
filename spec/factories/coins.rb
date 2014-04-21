FactoryGirl.define do
  factory :coin do
    value     1000
    chest

    factory :negative_coins do
      value     -1000
    end
  end
end
