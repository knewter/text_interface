require 'rake/testtask'

task :test_env do
  ENV['RAILS_ENV'] = 'test'
end

namespace :test do
  desc "Runs the entire test suite."
  task :all => :test_env do
    Rake::Task['test'].invoke
  end
end

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end
