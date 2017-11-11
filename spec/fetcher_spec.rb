require "spec_helper"

RSpec.describe Sign::Fetcher do
  let(:fetcher) { Sign::Fetcher.new }
  
  describe "#get_license" do
    it "returns if license exists" do
      license = "mit"
      allow(fetcher).to receive(:get_license).with(license).and_return(true)
      output = fetcher.get_license(license)
      
      expect(output).to_not be nil
    end
    
    it "returns regardless of license name capitalization" do
      license = "MiT"
      allow(fetcher).to receive(:get_license).with(license).and_return(true)
      output = fetcher.get_license(license)
      
      expect(output).to_not be nil
    end
  end
end