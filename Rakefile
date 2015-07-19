require "bundler/gem_tasks"
require 'rake/testtask'
require 'coveralls'
Coveralls.wear!

Rake::TestTask.new do |t|
  t.libs = ["ivan"]
  t.test_files = FileList['test/test_*.rb']
end
