require "minitest/autorun"
require "ivan/primitives/point"

class TestPoint < Minitest::Test
  def setup
    @point = Point.new([0,0,0])
  end

  def test_that_it_has_a_coordinate
    assert_equal [0,0,0], @point.coordinate
  end
end