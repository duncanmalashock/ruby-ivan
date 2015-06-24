require_relative "minitest_helper"

describe Point3D do
  before do
    @a_point = Point3D.new(x = 10, y = 20, z = 30)
  end

  describe "when initialized with x, y, and z parameters" do
    it "responds correctly to x" do
      assert_respond_to @a_point, :x
      assert_equal 10, @a_point.x
    end
    it "responds correctly to y" do
      assert_respond_to @a_point, :y
      assert_equal 20, @a_point.y
    end
    it "responds correctly to z" do
      assert_respond_to @a_point, :z
      assert_equal 30, @a_point.z
    end
  end

  describe "after rotating on the X axis" do
    it "returns a Point3D with the correct coordinates" do
      @rotated_point = @a_point.rotate_x(2.0)
      assert_equal 10, @rotated_point.x
      assert_equal -35.6018595357133, @rotated_point.y
      assert_equal 5.701543440099362, @rotated_point.z
    end
  end

  describe "after rotating on the Y axis" do
    it "returns a Point3D with the correct coordinates" do
      @rotated_point = @a_point.rotate_y(2.0)
      assert_equal 23.117454439299028, @rotated_point.x
      assert_equal 20, @rotated_point.y
      assert_equal -21.57737936467109, @rotated_point.z
    end
  end

end