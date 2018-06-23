module Classroom
    module Commands
        class Foo
            def initialize options
                puts "Hello from FOOOOHOOOO"
                puts "Hello from FOOOOHOOOO MOOORRRRRREEEEEEE" if options[:verbose]
            end

            def self.optsparser options
                OptionParser.new do |opts|
                    opts.banner = "Usage: classroom foo [options]"
        
                    opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
                        options[:verbose] = v
                    end
                end
            end
        end
    end
end