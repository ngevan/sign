module Sign
  class Fetcher
    LIST = [
      "mit"   # initial test run
    ]
    
    def get(license)
      if LIST.include?(license.downcase)
        file_name = "#{license}.txt"
        File.open("#{license_path}/#{file_name}")
      else
        raise ArgumentError, "#{license} is not available."
      end
    end
    
    def license_path
      File.expand_path("../../vendor/licenses", __dir__)
    end
  end
end