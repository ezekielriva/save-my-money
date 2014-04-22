class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :chests
  has_many :coins
  has_many :categories

  validates :chests, presence: true

  before_validation :default_values

  def default_values
    if new_record?
      chests << Chest.build_default_chest
      categories << Category.build_default_categories
    end
  end
end
