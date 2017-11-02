require "spec_helper"

RSpec.describe Sign::Runner do
  let(:cli) { Sign::Runner.new }

  after(:each) do
    ARGV.clear
  end
  
  context "#show_help" do
    it "returns help when no arguments are given" do
      output = capture_stdout { cli.start }

      expect(output).to eq(fixture("help-fixture.txt").read)
    end

    it "returns help information with '--help'" do
      ARGV << "--help"
      output = capture_stdout { cli.start }

      expect(output).to eq(fixture("help-fixture.txt").read)
    end
  end
  
  context "#show_list" do
    it "returns a list of available licenses with '--list'" do
      ARGV << "--list"
      output = capture_stdout { cli.start }

      expect(output).to eq(fixture("list-fixture.txt").read)
    end
  end
  
  context "#create_license" do
    it "parses user arguments for name and year if given" do
      name = "--name=Rick Deckard"
      year = "--year=2049"
      
      expect(cli.parse_argument(name)).to eq("Rick Deckard")
      expect(cli.parse_argument(year)).to eq("2049")
    end
    
    it "calls Sign::Fetcher#get_license to retrieve license" do
      argv = ["mit", "Rick Deckard", "2049"]
      fetcher = Sign::Fetcher.new
      
      expect(cli).to receive(:create_license).with(argv).and_return(fetcher)
      expect(fetcher).to receive(:get_license).with(argv[0])
      cli.create_license(argv)
      fetcher.get_license(argv[0])
    end
    
    it "calls Sign::Generator#create to create license file" do
      argv = ["mit", "Rick Deckard", "2049"]
      generator = Sign::Generator.new
      
      expect(cli).to receive(:create_license).with(argv).and_return(generator)
      expect(generator).to receive(:create).with(argv)
      cli.create_license(argv)
      generator.create(argv)
    end
  end
end
