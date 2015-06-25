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

    it "is not screen safe" do
      assert_respond_to @a_point, :screen_safe?
      assert_equal false, @a_point.screen_safe?(:dummy_value)
    end
  end

  describe "after translating" do
    it "returns a Point3D with the correct coordinates" do
      @translated_point = @a_point.translate([2, 2, 2])
      assert_equal 12, @translated_point.x
      assert_equal 22, @translated_point.y
      assert_equal 32, @translated_point.z
    end
  end

  describe "after scaling" do
    it "returns a Point3D with the correct coordinates" do
      @translated_point = @a_point.scale([0.1, 0.1, 0.1])
      assert_equal 1, @translated_point.x
      assert_equal 2, @translated_point.y
      assert_equal 3, @translated_point.z
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

  describe "after rotating on the Z axis" do
    it "returns a Point3D with the correct coordinates" do
      @rotated_point = @a_point.rotate_z(2.0)
      assert_equal -22.34741690198506, @rotated_point.x
      assert_equal 0.7700375373139696, @rotated_point.y
      assert_equal 30, @rotated_point.z
    end
  end

  describe "after projecting to 2D" do
    it "returns a Point2D with no #z attribute" do
      assert_raises NoMethodError do
        @a_point.project().z
      end
    end
    it "returns with the correct coordinates" do
      @projected_point = @a_point.project()
      assert_equal 13.157894736842104, @projected_point.x
      assert_equal 26.31578947368421, @projected_point.y
    end
  end

end