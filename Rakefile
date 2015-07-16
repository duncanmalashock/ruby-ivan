require 'rake/testtask'
require "codeclimate-test-reporter"

CodeClimate::TestReporter.start

Rake::TestTask.new do |t|
  SimpleCov.command_name 'test:units'
  t.libs = ["ivan"]
  t.test_files = FileList['test/test_*.rb']
end
