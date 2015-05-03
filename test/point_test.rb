require "minitest_helper"
require "ivan/primitives/point"

describe Point do
  subject { Point.new([0,0,0]) }

  it "must have a coordinate" do
    subject.coordinate.must_equal [0,0,0]
  end
end
