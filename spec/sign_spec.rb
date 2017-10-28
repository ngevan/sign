require "spec_helper"

RSpec.describe Sign do
  it "has a version number" do
    expect(Sign::VERSION).not_to be nil
  end
end
