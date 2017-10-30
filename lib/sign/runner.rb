module Sign
  class Runner
    def start
      ARGV << "--help" if ARGV.empty?

      display_help if ARGV[0] == "--help"
      display_version if ARGV[0] == "--version"
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
      puts "      --help     display help information"
      puts ""
    end
    
    def display_version
      puts "Sign v" + Sign::VERSION
    end
  end
end
