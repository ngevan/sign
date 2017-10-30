module Sign
  class Runner
    def start
      ARGV << "--help" if ARGV.empty?

      case ARGV[0]
      when "--help"
        display_help
      when "--version"
        display_version
      else
        create_license(ARGV)
      end
    end

    def display_help
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
      puts ""
    end
    
    def display_version
      puts "Sign v" + Sign::VERSION
    end
    
    def create_license(args)
      license = Sign::Fetcher.get(args[0].downcase)
    end
  end
end
