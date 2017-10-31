module Sign
  class Fetcher
    LIST = [
      "mit"   # initial test run
    ]
    
    def get(license)
      if LIST.include?(license)
        file_name = license + ".txt"
        license_path = File.expand_path("../../vendor/licenses", __dir__)
        license_file = File.open(license_path + "/" + file_name)
      else
        return "ArgumentError: #{license} is not available."
      end
    end
  end
end