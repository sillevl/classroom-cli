require "classroom/version"
require "classroom/commands/foo"
require "classroom/commands/bar"
require "classroom/commands/version"
require "classroom/commands/clone"
require "classroom/commands/repos"
require "classroom/commands/push"

module Classroom
  class Cli
    def initialize
      require 'optparse'

      options = {}
      cli = OptionParser.new do |opts|
        opts.banner = 
          "    ___  _                                                 \n"\
          "   / __\\| |  __ _  ___  ___  _ __   ___    ___   _ __ ___  \n"\
          "  / /   | | / _` |/ __|/ __|| '__| / _ \\  / _ \\ | '_ ` _ \\ \n"\
          " / /___ | || (_| |\\__ \\\\__ \\| |   | (_) || (_) || | | | | |\n"\
          " \\____/ |_| \\__,_||___/|___/|_|    \\___/  \\___/ |_| |_| |_|\n"\
          "\n"\
        "Usage: classroom [options]"

        opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
          options[:verbose] = v
        end
      end

      subcommands = { 
        'version' => Classroom::Commands::Version,
        'clone' => Classroom::Commands::Clone,
        'foo' => Classroom::Commands::Foo,
        'bar' => Classroom::Commands::Bar,
        'repos' => Classroom::Commands::Repos,
        'push' => Classroom::Commands::Push
      }

      cli.order!
      command = subcommands[ARGV.shift]
      if command
        command.optsparser(options).order!
        command.new(options)
      else
        puts cli.help
      end
    end
  end
end
