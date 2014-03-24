FactoryGirl.define do
  factory :chest do
    sequence(:name) { |n| "Chest ##{n}" }

    factory :default_chest do
      name  'Default Chest'
    end
  end
end
