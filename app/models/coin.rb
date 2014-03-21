class Coin < ActiveRecord::Base
  belongs_to :category
  belongs_to :chest
  belongs_to :user
end
