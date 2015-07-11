require 'minitest/autorun'
require "minitest/pride"
require "codeclimate-test-reporter"

CodeClimate::TestReporter.start

require_relative "../lib/ivan"
require_relative "fixtures"
