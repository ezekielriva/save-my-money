class Chest < ActiveRecord::Base
  has_many :coins
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: { scope: :user_id }

  def balance
    coins.sum(:value)
  end
end
