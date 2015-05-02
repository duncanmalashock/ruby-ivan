require "minitest/autorun"
require "ivan/primitives/point"

describe Point do
  before do
    @point = Point.new([0,0,0])
  end

  it "must have a coordinate" do
    @point.coordinate.must_equal [0,0]
  end
end