require 'bundler/setup'
require 'aquaman'
require 'ffaker'
require 'active_support'
require 'active_support/core_ext'

Pathname.glob('spec/support/**/*.rb').each { |f| require_relative "../#{f}" }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:all)  { FFaker::Random.seed = config.seed }
  config.before(:each) { FFaker::Random.reset! }
end
