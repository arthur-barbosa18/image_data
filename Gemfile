source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

# Base
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'rack-cors', require: 'rack/cors'
gem 'rails', '~> 5.2.0'
gem 'puma', '~> 3.11'

# App

gem 'interactor', '~> 3.0'
gem 'kaminari', '~> 1.1.1'
gem 'fast_jsonapi', '~> 1.2'
gem 'responders', '~> 2.4.0'
gem 'has_scope', '~> 0.7.2'
gem 'acts_as_paranoid', '~> 0.6.0'
gem 'paper_trail', '~> 9.1.1'
gem 'enumerize', '>= 2.2' 
gem 'image_size', '~> 2.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'brakeman', require: false
  gem 'rswag', '~> 2.0.3'
  gem 'rspec_api_documentation', '~> 4.9.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'shoulda-callback-matchers', '~> 1.1.1'
  gem 'factory_bot_rails'
  gem 'rails-controller-testing', '~> 1.0.2' 
  gem 'rubocop', require: false
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rails-erd'
end

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'faker'
  gem 'rspec-rails'
  gem 'simplecov', require: false
  gem 'rack-test'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
