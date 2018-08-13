require 'bundler/setup'
require 'aquaman'
require 'ffaker'
require 'active_support'
require 'active_support/core_ext'
require 'simplecov'

Pathname.glob('spec/support/**/*.rb').each { |f| require_relative "../#{f}" }

SimpleCov.start 'rails' do
  add_filter '/bin/'
  add_filter '/spec/'

  minimum_coverage 90
  # NOTE: we can't enable refuse because tests are run in parallel.
  # refuse_coverage_drop
end

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
