class Coin < ActiveRecord::Base
  belongs_to :category
  belongs_to :chest
  belongs_to :user
  belongs_to :parent, class_name: 'Coin'

  validates :value, presence: true
  validates :period, presence: true, if: :is_recurrent

  scope :no_recurrent, -> { where(is_recurrent: false) }
  scope :recurrent, -> { where(is_recurrent: true) }
  scope :by_date, ->(filter) { where(created_at: filter.beginning_of_month..filter.end_of_month) }

  DEFAULT_PERIODS = [
    { name: 'dayly', time: 1 },
    { name: 'weekely', time: 7 },
    { name: 'monthly', time: 30 },
    { name: 'bimonthly', time: 60 },
    { name: 'termly', time: 90 },
    { name: 'quarterly', time: 120 },
    { name: 'yearly', time: 360 }
  ]

  def from_recurrent
    !parent.blank?
  end
end
