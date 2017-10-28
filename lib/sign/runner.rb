module Sign
  class Runner
    def start
      ARGV << "--help" if ARGV.empty?

      case ARGV[0]
      when "--help"
        display_help
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
      puts "      --help     display help information"
      puts ""
    end
  end
end
