FactoryGirl.define do
  factory :user do
    sequence(:email)      {|n| "john-#{n}@doe.test"}
    password              '123123123'
    password_confirmation '123123123'
  end
end
