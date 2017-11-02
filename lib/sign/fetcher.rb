module Sign
  class Fetcher
    @@list = {}
    
    Dir["vendor/licenses/*.txt"].select do |file|
      if File.file?(file)
        name = File.basename(file, ".txt")
        info = File.open(file){ |file| file.readline }.downcase.strip.gsub(/[^-a-z0-9\s]/, "")
        @@list[name] = info
      end
    end
    
    def self.get_list
      format = "%-16s %10s"
      
      @@list.each do |name, info| 
        puts format % [name, info]
      end
    end
    
    def get(license)
      if @@list.has_key?(license.downcase)
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