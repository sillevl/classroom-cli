module Classroom
    module Commands
        class Bar
            def initialize options
                puts "Hello from BARAARARARARARRA"
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