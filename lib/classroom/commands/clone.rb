require 'yaml'

module Classroom
    module Commands
        class Clone
            def initialize options

                # TODO: make file an option, and give error if file does not exist
                projects = YAML.load_file('projects.yml')['projects']
                puts projects.inspect if options[:verbose]

                puts "Cloning projects..."
                projects.each do |url|
                    # student_name = url[/github.com\/(.*)\//, 1]
                    # # puts student_name
                
                    # url_path = url[/github.com\/(.*)/, 1] + ".git"
                    # ssh_url = "git@git.github.com:" + url_path
                
                    clone_project url
                end
                puts "done!"
            end

            def clone_project url, project_name = nil
                # TODO: enable to choose projectname 
                system("git clone #{url}")
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




