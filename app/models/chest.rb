class Chest < ActiveRecord::Base
  has_many :coins
  belongs_to :user

  validate :name, presence: true
end
