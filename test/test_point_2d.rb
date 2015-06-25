require_relative "minitest_helper"

describe Point2D do
  before do
    @a_point = Point2D.new(1.0, 2.0)
    @a_boundary = {
      x_min: 0,
      y_min: 0,
      x_max: 255,
      y_max: 255,
    }
    @another_boundary = {
      x_min: 0,
      y_min: 0,
      x_max: 1,
      y_max: 1,
    }
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

  describe "when screen_safe? is run with a valid boundary" do
    it "responds true" do
      assert_respond_to @a_point, :screen_safe?
      assert_equal true, @a_point.screen_safe?(@a_boundary)
    end
  end

  describe "when screen_safe? is run with an invalid boundary" do
    it "responds false" do
      assert_equal false, @a_point.screen_safe?(@another_boundary)
    end
  end

end