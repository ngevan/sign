require "spec_helper"

RSpec.describe Sign do
  let(:cli) { Sign::Runner.new }

  after(:each) do
    ARGV.clear
  end

  it "starts successfully on initialization" do
    expect(cli).to_not be nil
  end
  
  it "has a version number" do
    expect(Sign::VERSION).not_to be nil
  end
  
  it "returns version number with '--version'" do
    ARGV << "--version"
    output = capture_stdout { cli.start }
    version = "Sign v#{Sign::VERSION}\n"
    
    expect(output).to eq(version)
  end
end
