require "spec_helper"

RSpec.describe Sign::Fetcher do
  let(:fetcher) { Sign::Fetcher.new }
  
  describe "#get_license" do
    it "returns if license exists" do
      license = "mit"
      output = fetcher.get_license(license)
      
      expect(output).to_not be nil
    end
    
    it "returns regardless of license name capitalization" do
      license = "MiT"
      output = fetcher.get_license(license)
      
      expect(output).to_not be nil
    end
    
    it "returns an error if license is not available" do
      license = "Stanford"
      
      expect{ fetcher.get_license(license) }.to raise_error(ArgumentError)
    end
  end
end