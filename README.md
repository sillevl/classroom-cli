# Classroom::Cli

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/classroom/cli`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'classroom-cli'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install classroom-cli

## Usage

### Cloning

The clone command will clone a set of repositories at once. The set of repositories is defined in a `projects.yml` file.

```
$ classroom clone
```

add a `projects.yml` file to your project directory containing the following example content:

```yml
projects:
- https://github.com/courseabc/xyz
- https://github.com/courseabc/opq
```

### Fetching repos from a user or organization

The `repos` command will create a yaml file containing all the repos of a user or organization.

Options:

* `--user <username>`: fetch all repos of a user.
* `--org <organization>`: fetch all repos of an organization.
* `--token <auth_token>`: provide an authentication token - required if you wish to also retrieve private repos.
* `--file <name.yml>`: you can provide an alternative filename to output the projects to. If none is provided it defaults to `projects.yml`

An authentication token can be create on your personal profile settings page (`Settings => Developer settings => Personal access tokens`).

Example:

```shell
classroom repos --token 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' --user 'BioBoost' --file my_repos.yml
```

This fetches all my personal repos, including the private once since a token is provided. The results are saved to a file `my_repos.yml`.

### Pushing updates to listed repos

*This is still under development and should be used with care!*

The `push` command will allow you to add, commit and push **all changes** to the remotes specified in the `projects.yaml` file.

Options:

* `--message <message>`: specify the commit message
* `--yes`: do not ask to undertake action and just add, commit and push. Otherwise for each repo it will be asked.

## Development

Running the executable while developing:

```shell
ruby -Ilib .\exe\classroom.rb
```

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/classroom-cli.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
