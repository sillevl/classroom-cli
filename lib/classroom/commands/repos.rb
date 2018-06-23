require 'yaml'
require 'github_api'
require 'json'

module Classroom
    module Commands
        class Repos
            def initialize options
                # TODO: This should probable be done in another way
                puts "User or organization required" unless (options[:org] || options[:user])
                filename = options[:file] || 'projects.yml'
                identifier = options[:org] || options[:user]

                return unless continue_if_file_exists? filename

                puts "Proceeding with fetching repos ..." if options[:verbose]
                repos = get_repos identifier, options[:token], options.has_key?(:org)
                puts "Found " + repos.length.to_s + " repos" if options[:verbose]
                
                puts "Writing repo list to yaml file: " + filename if options[:verbose]
                write_to_projects_file repos, filename
            end

            def continue_if_file_exists? filename='projects.yml'
                if File.file?(filename)
                    userResponse = ""
                    while (userResponse != "y" && userResponse != "n")
                        print "Warning: " + filename + " exists and will be overriden. Continue? [Y/n]"
                        userResponse = (userResponse = gets.chomp.downcase).empty? ? "y" : userResponse
                    end
                    return (userResponse == "y")
                end
                return true
            end

            def get_repos identifier, token='', is_organization=true
                github = Github.new(auto_pagination: true, oauth_token: token)

                response = (is_organization ? (github.repos.list org: identifier) : (github.repos.list user: identifier))
                repos = []
                response.each do |repo|
                    repos << repo.ssh_url
                end
                return repos
            end

            def write_to_projects_file repos, filename='projects.yml'
                File.write(filename, {'projects' => repos}.to_yaml)
            end

            def self.optsparser options
                OptionParser.new do |opts|
                    opts.banner = "Usage: classroom repos [options]"
        
                    opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
                        options[:verbose] = v
                    end
        
                    opts.on("-u", "--user USER", "Fetch all repos of user") do |user|
                        options[:user] = user
                    end
        
                    opts.on("-o", "--org ORGANIZATION", "Fetch all repos of organization") do |org|
                        options[:org] = org
                    end
        
                    opts.on("-t", "--token TOKEN", "Authorization token") do |token|
                        options[:token] = token
                    end
        
                    opts.on("-f", "--file NAME", "Yanl file with projects to use") do |file|
                        options[:file] = file
                    end
                end
            end
        end
    end
end