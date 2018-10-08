require 'yaml'

module Classroom
    module Commands
        class Push
            def initialize options
                # TODO: make file an option, and give error if file does not exist
                projects = YAML.load_file('projects.yml')['projects']
                puts projects.inspect if options[:verbose]
                message = options[:message] || 'Automatic update from classroom-cli'

                puts "Ready to push updates to remote" if options[:verbose]
                projects.each do |url|
                    puts "For #{url}"
                    push_project url, message, 'origin', 'master', options[:update_without_asking]
                end
                puts "done!"
            end

            def push_project url, message, remote, branch, update_without_asking
                dirname = url.split('/').last.delete_suffix('.git')
                Dir.chdir(dirname) do
                  if !((output = `git status -s`) == '')
                    puts output
                    answer = 'Y'
                    if !update_without_asking
                      print "Add, commit and push all this? [Y/n]"
                      answer = gets.chomp.upcase
                    end
                    if answer == 'Y' || answer == ''
                      system("git add .")
                      system("git commit -m \"#{message}\"")
                      system("git push #{remote} #{branch}")
                    end
                  end
                end
            end

            def self.optsparser options
                OptionParser.new do |opts|
                    opts.banner = "Usage: classroom foo [options]"
        
                    opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
                        options[:verbose] = v
                    end
        
                    opts.on("-m", "--message MESSAGE", "Commit message") do |message|
                        options[:message] = message
                    end
        
                    opts.on("-y", "--yes", "Update all repos without asking") do |update_without_asking|
                        options[:update_without_asking] = update_without_asking
                    end
                end
            end
        end
    end
end




