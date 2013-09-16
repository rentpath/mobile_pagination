require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

task :update_contributors do
  puts 'Updating CONTRIBUTORS file'
  contributors = `git log --format='%aN' | sort -u`.split("\n")
  contributors_file = 'CONTRIBUTORS'
  contributors.each do |contributor|
    unless File.read(contributors_file).match(contributor)
      File.open(contributors_file, 'a') { |file| file.write("#{contributor}\n") }
    end
  end
end

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

task 'build' => :update_contributors
