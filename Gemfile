source "https://rubygems.org"

# Ensure github repositories are fetched using HTTPS
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  puts(repo_name)
  "https://github.com/#{repo_name}.git"
end if Gem::Version.new(Bundler::VERSION) < Gem::Version.new('2')

gem "fastlane", "~> 2.174.0"
gem 'digest-crc', "~> 0.5.1"
gem 'cocoapods', "1.11.3"
gem 'synx', "~> 0.2.1"
gem 'xcpretty', "0.3.0"
gem 'declarative-option', "0.1.0"
gem 'generamba', github: 'surfstudio/Generamba', branch: 'develop', :ref => '91957270f4bc0092305ce6dbf016be5259720d33'
gem "jazzy", "0.13.4"

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval_gemfile(plugins_path) if File.exist?(plugins_path)


