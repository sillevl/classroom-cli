require "classroom/version"

module Classroom
    module Commands
        class Version
            def initialize options
                puts Classroom::VERSION
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