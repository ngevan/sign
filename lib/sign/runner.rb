module Sign
  class Runner
    def start
      argv = ARGV.clone
      argv << "--help" if argv.empty?

      case argv[0]
      when "--help", "-h"
        show_help
      when "--version", "-v"
        show_version
      when "--list", "-l"
        show_list
      else
        create_license(argv) unless license_exist?
      end
    end

    def show_help
      puts ""
      puts "  Generate a license for your project in a matter of seconds."
      puts ""
      puts "  Usage:"
      puts ""
      puts "      sign [option] <license>"
      puts ""
      puts "  Options:"
      puts ""
      puts "      --version | -v    display version number"
      puts "      --help    | -h    display help information"
      puts "      --list    | -l    display list of licenses"
      puts ""
    end
    
    def show_list
      puts ""
      puts "List of available licenses:"
      puts ""
      Sign::Fetcher.get_list
      puts ""
    end
    
    def show_version
      puts "Sign v#{Sign::VERSION}"
    end
    
    def license_exist?
      if File.exist?("LICENSE")
        argv = ARGV.clone     # save user's first inputs for license
        ARGV.clear            # clears ARGV to allow for next input
        
        puts "There seems to be a license file already. Would you like to overwrite it? [y/n]"
        input = gets.chomp.downcase
        
        yes = ["y", "yes"]
        no = ["n", "no"]
        
        if yes.include?(input)
          return false
        elsif no.include?(input)
          puts "Terminating..."
          
          exit
        else
          puts "Sorry, I didn't get that. Let's try again."
          license_exist?
        end
      end
    end
    
    def create_license(argv)
      license = Sign::Fetcher.new.get_license(argv[0])
      name = !!argv[1] ? parse_argument(argv[1]) : nil
      year = !!argv[2] ? parse_argument(argv[2]) : nil
      
      Sign::Generator.new.create(license, name, year)
    end
    
    def parse_argument(arg)
      arg.scan(/=(.*)/).last[0]
    end
  end
end
