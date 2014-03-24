FactoryGirl.define do
  factory :user do
    sequence(:email)      {|n| "john-#{n}@doe.test"}
    password              '123123123'
    password_confirmation '123123123'

    factory :user_with_chests do
      ignore { chests_count 5 }

      after(:create) do |user, evaluator|
        create_list(:chest, evaluator.chests_count, user: user )
      end
    end
  end
end
