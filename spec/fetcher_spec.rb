require "spec_helper"

RSpec.describe Sign::Fetcher do
  let(:fetcher) { Sign::Fetcher.new }
  
  describe ".get method" do
    it "returns if license exists" do
      user_input = "mit"
      output = fetcher.get(user_input)
      
      expect(output).to_not be nil
    end
    
    it "returns regardless of license name capitalization" do
      user_input = "MiT"
      output = fetcher.get(user_input)
      
      expect(output).to_not be nil
    end
    
    it "returns an error if license is not available" do
      user_input = "Stanford"
      output = fetcher.get(user_input)
      
      expect(output).to eq("ArgumentError: #{user_input} is not available.")
    end
  end
end