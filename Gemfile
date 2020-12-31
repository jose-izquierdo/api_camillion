source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Api documentation
gem 'yard'

# Authorization
gem 'pundit'
gem 'rolify'

# Serialization
gem 'active_model_serializers'

# Pagination
gem 'will_paginate', '~> 3.1.0'

# CI
gem 'travis'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'database_cleaner'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'shoulda-matchers' 
  gem 'factory_bot_rails'
  gem 'simplecov', require: false
  gem 'faker'
  gem 'capybara'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
