require "Date"

module Sign
  class Generator
    def create(license, name, year)
      raise ArgumentError, "#{license} is not available." unless File.readable?(license)

      license_template = File.read(license)
      name = get_name if name.nil?
      year = get_year if year.nil?
      
      if placeholders_exist?(license_template)
        modified_license = license_template.gsub("[AUTHOR]", name)
        modified_license = modified_license.gsub("[YEAR]", year)
      end
      
      create_new_file(modified_license)
    end
    
    def placeholders_exist?(license_template)
      placeholders = ["[YEAR]", "[AUTHOR]"]
  
      placeholders.any? { |placeholder| license_template.include?(placeholder) }
    end
    
    def create_new_file(modified_license)
      new_file = File.new("LICENSE", "w")
      new_file.puts(modified_license)
      new_file.close
      puts "License created \033[91m<3\033[0m"
    end
    
    def get_name
      if gitconfig_exist?
        find_name
      else
        return ""
      end
    end
    
    def find_name
      File.foreach("#{gitconfig_path}/.gitconfig").detect do |line| 
        if line.match("\tname")
          return line.scan(/= (.*)/).last[0]
        end
      end
    end
    
    def get_year
      return Date.today.year.to_s
    end
    
    def gitconfig_exist?
      File.exist?("#{gitconfig_path}/.gitconfig")
    end
    
    def gitconfig_path
      File.expand_path("~/", __dir__)
    end
  end
end