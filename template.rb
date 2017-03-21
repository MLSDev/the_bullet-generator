gem 'bcrypt'
gem 'redis'
gem 'redis-objects'
gem 'rack-cors', require: 'rack/cors'
gem 'kaminari'
gem 'dotenv-rails'
gem 'draper', '~> 3.0.0.pre1'

# sign in/sign out/etc
authentication = yes?('Include authentication? Sign in, sign out, etc.')

authorization = nil

if authentication
  # pundit
  authorization = yes?('Include permissions stuff?')
end

if authorization
  gem 'pundit'
end

sidekiq = yes?('Include sidekiq?')

if sidekiq
  gem 'sidekiq'
end

push_notifications = yes?('Include push notifications?')

if push_notifications
  gem 'rpush'
end

swagger = yes?('Include swagger?')

if swagger
  gem 'swagger-blocks'
end

gem 'paperclip'
gem 'paperclip-meta'

gem_group :production do
  gem 'lograge'
  gem 'exception_notification'
  gem 'rack-timeout'
  gem 'newrelic_rpm'
end

rspec = yes?('Include rspec?')

gem_group :development, :test do
  gem 'rspec-rails' if rspec
  gem 'pry-rails'
  gem 'awesome_print', require: 'ap'
  gem 'faker'
  gem 'factory_girl_rails' if rspec
end

gem_group :development do
  # rubocop version locked due config. Update rubocop config on gem update.
  gem 'rubocop', '0.47.1', require: false
end
