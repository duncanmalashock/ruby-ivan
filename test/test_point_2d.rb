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
      @a_point.must_respond_to :x
      @a_point.x.must_equal 1.0
    end
    it "responds correctly to y" do
      @a_point.must_respond_to :y
      @a_point.y.must_equal 2.0
    end
  end

  describe "when screen_safe? is run with a valid boundary" do
    it "responds true" do
      @a_point.must_respond_to :screen_safe?
      @a_point.screen_safe?(@a_boundary).must_equal true
    end
  end

  describe "when screen_safe? is run with an invalid boundary" do
    it "responds false" do
      @a_point.must_respond_to :screen_safe?
      @a_point.screen_safe?(@another_boundary).must_equal false
    end
  end

end