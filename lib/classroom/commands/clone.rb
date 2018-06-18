require 'yaml'

module Classroom
    module Commands
        class Clone
            def initialize options

                # TODO: make file an option, and give error if file does not exist
                projects = YAML.load_file('projects.yml')['projects']

                puts "Clongin projects..."
                projects.each do |url|
                    student_name = url[/github.com\/(.*)\//, 1]
                    # puts student_name
                
                    url_path = url[/github.com\/(.*)/, 1] + ".git"
                    ssh_url = "git@git.github.com:" + url_path
                
                    # puts ssh_url
                
                    clone_project ssh_url, student_name
                end
                puts "done!"
            end

            def def clone_project url, project_name
                system("git clone #{url} #{project_name}")
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




