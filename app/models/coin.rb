class Coin < ActiveRecord::Base
  belongs_to :category
  belongs_to :chest
  belongs_to :user

  validates :period, presence: true, if: :is_recurrent

  DEFAULT_PERIODS = [
    { name: 'dayly', time: 1 },
    { name: 'weekely', time: 7 },
    { name: 'monthly', time: 30 },
    { name: 'bimonthly', time: 60 },
    { name: 'termly', time: 90 },
    { name: 'quarterly', time: 120 },
    { name: 'yearly', time: 360 }
  ]
end
