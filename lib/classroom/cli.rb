require "classroom/version"
require "classroom/commands/foo"
require "classroom/commands/bar"
require "classroom/commands/version"

module Classroom
  class Cli
    def initialize
      require 'optparse'

      options = {}
      cli = OptionParser.new do |opts|
        opts.banner = "Usage: classroom [options]"

        opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
          options[:verbose] = v
        end
      end

      subcommands = { 
        'version' => Classroom::Commands::Version,
        'foo' => Classroom::Commands::Foo,
        'bar' => Classroom::Commands::Bar
      }

      cli.order!
      command = subcommands[ARGV.shift]
      if command
        command.optsparser.order! 
        command.new(options)
      else
        puts cli.help
      end
    end
  end
end
