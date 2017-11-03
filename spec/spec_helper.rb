require "bundler/setup"
require "sign"
require "test_helper"
require "Date"

RSpec.configure do |config|
  config.example_status_persistence_file_path = ".rspec_status"
  config.disable_monkey_patching!
  config.include TestHelper

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  def fixture_path
    File.expand_path("../fixtures", __FILE__)
  end

  def fixture(file)
    File.new(fixture_path + "/" + file)
  end
end
