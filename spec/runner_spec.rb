require "spec_helper"

RSpec.describe Sign::Runner do
  let(:cli) { Sign::Runner.new }

  after(:each) do
    ARGV.clear
  end

  it "starts successfully on initialization" do
    expect(cli).to_not be nil
  end

  it "returns help when no arguments are given" do
    output = capture_stdout { cli.start }

    expect(output).to eq(fixture("help.txt").read)
  end

  it "returns help information with '--help'" do
    ARGV << "--help"
    output = capture_stdout { cli.start }

    expect(output).to eq(fixture("help.txt").read)
  end
  
  it "returns version number with '--version'" do
    ARGV << "--version"
    output = capture_stdout { cli.start }
    version = "Sign v#{Sign::VERSION}\n"
    expect(output).to eq(version)
  end
end
