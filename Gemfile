source 'https://rubygems.org'

gem 'rails', '4.2.1'
gem 'rails-api'
gem 'spring', :group => :development
gem 'active_model_serializers', github: "rails-api/active_model_serializers"
gem 'rails-i18n'
gem 'rack-cors', :require => 'rack/cors'
gem 'devise_token_auth'
gem 'mailgun_rails'

group :development, :test do
  gem 'hirb', '~> 0.7.3'
  gem 'byebug', '~> 8.2', '>= 8.2.2'
  gem 'faker', '~> 1.6', '>= 1.6.3'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'faker', '~> 1.6', '>= 1.6.3'
end
