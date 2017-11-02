module Sign
  class Runner
    def start
      argv = ARGV.clone
      argv << "--help" if argv.empty?

      case argv[0]
      when "--help"
        show_help
      when "--version"
        show_version
      when "--list"
        show_list
      else
        create_license(argv)
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
      puts "      --version   display version number"
      puts "      --help      display help information"
      puts "      --list      display list of licenses"
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
