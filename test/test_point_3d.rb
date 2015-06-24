require_relative "minitest_helper"

describe Point3D do
  before do
    @a_point = Point3D.new(1.0, 2.0, 3.0)
  end

  describe "when initialized with x, y, and z parameters" do
    it "responds correctly to x" do
      assert_respond_to @a_point, :x
      assert_equal 1.0, @a_point.x
    end
    it "responds correctly to y" do
      assert_respond_to @a_point, :y
      assert_equal 2.0, @a_point.y
    end
    it "responds correctly to z" do
      assert_respond_to @a_point, :z
      assert_equal 3.0, @a_point.z
    end
  end

end