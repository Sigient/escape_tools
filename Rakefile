require 'bundler/gem_tasks'
require 'rake/testtask'
require 'thermite/tasks'

Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.libs << 'lib'

  t.test_files = FileList['test/**/*_test.rb']
end

Thermite::Tasks.new

task default: :test
