FactoryGirl.define do
  factory :coin do
    value     1000
    is_recurrent false
    chest
    category

    factory :negative_coins do
      value     -1000
    end

    factory :recurrent_coin do
      is_recurrent true
      period  1
      updated_at (Date.today - 1.day)

      factory :repeat_until_today do
        repeat_until Date.today
      end
    end
  end
end
