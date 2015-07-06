source 'https://rubygems.org'

# Dynamically load a Rails version for Travis

rails_version = ENV["RAILS_VERSION"] || 'default'

rails = case rails_version
          when 'default'
            '>= 4.2.0'
          else
            "~> #{rails_version}"
        end

puts "Using Rails version #{rails}"

gem 'rails', rails


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
  gem 'poltergeist'
end

group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers',      '~> 2.7.0'
end
