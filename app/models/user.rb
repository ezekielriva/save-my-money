class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :chests
  has_many :coins

  validates :chests, presence: true

  before_validation :default_values
  
  def default_values
    if new_record?
      chests << Chest.new(name: 'Default Chest')
    end
  end
end
