require 'rake/testtask'
require "codeclimate-test-reporter"

CodeClimate::TestReporter.start

Rake::TestTask.new do |t|
  t.libs = ["ivan"]
  t.test_files = FileList['test/test_*.rb']
end
