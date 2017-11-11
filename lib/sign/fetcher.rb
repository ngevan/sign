module Sign
  class Fetcher
  
    def self.get_list(list)
      Dir["#{$LOAD_PATH[2]}/licenses/*.txt"].select do |file|
        if File.file?(file)
          name = File.basename(file, ".txt")
          info = File.open(file){ |file| file.readline }.downcase.strip.gsub(/[^-a-z0-9\s]/, "")
          list[name] = info unless list.has_key?(name)
        end
      end
    end
    
    def get_license(license)      
      file_name = "#{license}.txt"
      File.open("#{license_path}/#{file_name}")
    end
    
    def license_path
      File.expand_path("#{$LOAD_PATH[2]}/licenses", __dir__)
    end
  end
end