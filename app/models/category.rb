class Category < ActiveRecord::Base
  has_many :coins
  belongs_to :user

  DEFAULT_CATEGORIES = [
    {name: 'School'},
    {name: 'University'},
    {name: 'Car'},
    {name: 'General'},
    {name: 'Gifts'}
  ]

  def self.build_default_categories
    Category::DEFAULT_CATEGORIES.map do |default|
      new(default)
    end
  end
end
