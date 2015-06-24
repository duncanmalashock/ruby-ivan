require_relative "minitest_helper"

describe Point2D do
  before do
    @a_point = Point2D.new(1.0, 2.0)
  end

  describe "when initialized with x and y parameters" do
    it "responds correctly to x" do
      assert_respond_to @a_point, :x
      assert_equal 1.0, @a_point.x
    end
    it "responds correctly to y" do
      assert_respond_to @a_point, :y
      assert_equal 2.0, @a_point.y
    end
  end

end