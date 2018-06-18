module Classroom
    module Commands
        class Foo
            def initialize options
                puts "Hello from FOOOOHOOOO"
            end

            def self.optsparser
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