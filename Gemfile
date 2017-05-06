source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.0'

gem 'rails', '~> 5.0.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'devise'
gem 'bootstrap-sass'
gem 'bourbon'
gem 'simple_form'
gem 'rmagick'
gem 'carrierwave', '~> 1.0'
gem "fog-aws"
gem "faker"
gem 'mail_form', '~> 1.5', '>= 1.5.1'

gem 'impressionist', '~> 1.5', '>= 1.5.1'
gem 'font-awesome-rails', '~> 4.7', '>= 4.7.0.1'
gem 'sendgrid-ruby'
gem 'newrelic_rpm', '~> 3.15', '>= 3.15.2.317'


gem "react-rails"

group :development, :test do
  gem 'byebug', platform: :mri
end

group :production do
  gem "rails_12factor"
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
