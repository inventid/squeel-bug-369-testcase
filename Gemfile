source 'https://rubygems.org'

# Dynamically load a Rails version for Travis

rails_version = ENV["RAILS_VERSION"] || "default"

rails = case rails_version
          when 'default'
            '>= 4.2.0'
          else
            "~> #{rails_version}"
        end

gem "rails", rails


gem 'sass-rails',   '~> 4.0.3'
gem 'jbuilder',     '~> 2.2'

gem 'mysql2'

gem 'bcrypt', '~> 3.1.9'

gem 'squeel', '~> 1.2.3' # Improves sql syntax

group :development do
  # Auto annotate models
  gem 'annotate'
end

group :development, :test do
  gem 'pry'
  gem 'thin'
  gem 'sqlite3'
  gem 'konacha'
  gem 'sinon-rails'
  gem 'sinon-chai-rails'
  gem 'konacha'
  gem 'poltergeist'
end

group :test do
  gem 'rspec-rails',           '~> 3.1.0'
  gem 'shoulda-matchers',      '~> 2.7.0'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
