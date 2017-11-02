require "spec_helper"
require "Date"

RSpec.describe Sign::Generator do
  let(:generator) { Sign::Generator.new }
  
  describe "#make" do
    it "returns an error if license is not an object" do
      license = "mit"
      name = "Rick Deckard"
      year = "2017"
      
      expect{ generator.make(license, name, year) }.to raise_error(ArgumentError)
    end
    
    context "if placeholders exist in license" do
      it "sets name as user's input if provided by the user" do
        argv = ["mit", "Rick Deckard", "2049"]
        
        expect(generator).to receive(:make).with(argv)
        generator.make(argv)
        
        expect(argv[1]).to be_a(String)
        expect(argv[1]).to eq("Rick Deckard")
      end
      
      it "sets year as user's input if provided by the user" do
        argv = ["mit", "Rick Deckard", "2049"]
        
        expect(generator).to receive(:make).with(argv)
        generator.make(argv)
        
        expect(argv[2]).to be_a(String)
        expect(argv[2]).to eq("2049")
      end
      
      it "sets name provided in gitconfig if it isn't provided by the user and gitconfig is found" do
        expect(generator).to receive(:gitconfig_exist?).and_return(true)
        expect(generator).to receive(:find_name).and_return("Rick Deckard")
        
        generator.gitconfig_exist?
        name = generator.find_name
        
        expect(name).to eq("Rick Deckard")
      end
      
      it "sets name as empty string if it isn't provided by the user and gitconfig does not exist" do      
        expect(generator).to receive(:gitconfig_exist?).and_return(false)
        expect(generator).to receive(:get_name).and_return("")
        
        generator.gitconfig_exist?
        name = generator.get_name
        
        expect(name).to eq("")
      end
      
      it "sets year as current year if it isn't provided by the user" do
        expect(generator.get_year).to eq(Date.today.year.to_s)
      end
    end
    
    it "creates a new 'LICENSE' file in the current project's root directory" do
      mit_original_fixture = fixture("mit-original-fixture.txt")
      mit_modified_fixture = fixture("mit-modified-fixture.txt")
      
      expect(generator).to receive(:create_new_file).with(mit_original_fixture).and_return(mit_modified_fixture)
      
      expect(generator.create_new_file(mit_original_fixture)).to eq(mit_modified_fixture)
    end
  end
end