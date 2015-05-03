require "minitest_helper"
require "ivan/primitives/actor"
require "ivan/primitives/cube"

describe Cube do
  subject { Cube.new }

  it "must have 8 points" do
    subject.points.count.must_equal 8
  end
  it "must have 12 lines" do
    subject.lines.count.must_equal 12
  end
end
