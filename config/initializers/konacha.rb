if defined?(Konacha)
  require 'capybara/poltergeist'

  Capybara.register_driver :slow_poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, :timeout => 5.minutes)
  end

  Konacha.configure do |config|
    config.spec_dir = "spec/javascripts"
    config.driver = :slow_poltergeist
  end
end
