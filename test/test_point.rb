require_relative "minitest_helper"

describe Point do
  before do
    @point_a = Point.new(1.0, 2.0)
    @point_b = Point.new(1.0, 2.0, 3.0)
  end

  describe "when initialized with x and y parameters only" do
    it "responds correctly to x" do
      assert_respond_to @point_a, :x
      assert_equal 1.0, @point_a.x
    end
    it "responds correctly to y" do
      assert_respond_to @point_a, :y
      assert_equal 2.0, @point_a.y
    end
    it "responds correctly to z" do
      assert_respond_to @point_a, :z
      assert_equal nil, @point_a.z
    end
  end

  describe "when initialized with x, y, and z parameters" do
    it "responds correctly to x" do
      assert_respond_to @point_b, :x
      assert_equal 1.0, @point_b.x
    end
    it "responds correctly to y" do
      assert_respond_to @point_b, :y
      assert_equal 2.0, @point_b.y
    end
    it "responds correctly to z" do
      assert_respond_to @point_b, :z
      assert_equal 3.0, @point_b.z
    end
  end

end