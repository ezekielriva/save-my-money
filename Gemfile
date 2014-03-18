source 'https://rubygems.org'

ruby "2.0.0"

gem 'rails',           '4.0.2'

gem 'sass-rails',      '~> 4.0.0'
gem 'uglifier',        '>= 1.3.0'
gem 'coffee-rails',    '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder',        '~> 1.2'
gem 'decent_exposure', '2.3.0'
gem 'dynamic_form'
gem 'inherited_resources', '1.4.1'
gem 'figaro'
gem 'devise'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', github: 'rspec/rspec-rails',
    ref: 'd8e14a2d34b702ffe2d3c29339b5b334597d84fd'
end

group :development do
  gem 'rails_best_practices', require: false
end

group :test do
  gem 'capybara',             '2.2.0'
  gem 'capybara-email',       github: 'dockyard/capybara-email'
  gem 'database_cleaner',     github: 'bmabey/database_cleaner'
  gem 'shoulda-matchers'
  gem 'launchy'
  gem 'simplecov',            require: false
  gem "factory_girl_rails"
end

group :doc do
  gem 'sdoc', require: false
end
