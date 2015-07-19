require_relative "minitest_helper"

describe Point do
  before do
    @a_point = Point.new(10, 20, 30)
    @another_point = Point.new(1.0, 2.0, 0)
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

  describe "Point class" do
    it "responds correctly to #transforms" do
      assert_equal [:translate, :scale, :rotate_x, :rotate_y, \
        :rotate_z ], @a_point.class.transforms
    end
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

    it "is not screen safe if z != 0" do
      assert_respond_to @a_point, :screen_safe?
      assert_equal false, @a_point.screen_safe?({
        x_min: 0,
        x_max: 200,
        y_min: 0,
        y_max: 200
      })
    end

    describe "when screen_safe? is run with a valid boundary" do
      it "responds true" do
        @another_point.must_respond_to :screen_safe?
        @another_point.screen_safe?(@a_boundary).must_equal true
      end
    end

    describe "when screen_safe? is run with an invalid boundary" do
      it "responds false" do
        @another_point.must_respond_to :screen_safe?
        @another_point.screen_safe?(@another_boundary).must_equal false
      end
    end
  end

  describe "after translating" do
    it "returns a Point with the correct coordinates" do
      @translated_point = @a_point.translate([2, 2, 2])
      assert_equal 12, @translated_point.x
      assert_equal 22, @translated_point.y
      assert_equal 32, @translated_point.z
    end
  end

  describe "after scaling" do
    it "returns a Point with the correct coordinates" do
      @translated_point = @a_point.scale([0.1, 0.1, 0.1])
      assert_equal 1, @translated_point.x
      assert_equal 2, @translated_point.y
      assert_equal 3, @translated_point.z
    end
  end

  describe "after rotating on the X axis" do
    it "returns a Point with the correct coordinates" do
      @rotated_point = @a_point.rotate_x(2.0)
      assert_equal 10, @rotated_point.x
      assert_equal -35.6018595357133, @rotated_point.y
      assert_equal 5.701543440099362, @rotated_point.z
    end
  end

  describe "after rotating on the Y axis" do
    it "returns a Point with the correct coordinates" do
      @rotated_point = @a_point.rotate_y(2.0)
      assert_equal 23.117454439299028, @rotated_point.x
      assert_equal 20, @rotated_point.y
      assert_equal -21.57737936467109, @rotated_point.z
    end
  end

  describe "after rotating on the Z axis" do
    it "returns a Point with the correct coordinates" do
      @rotated_point = @a_point.rotate_z(2.0)
      assert_equal -22.34741690198506, @rotated_point.x
      assert_equal 0.7700375373139696, @rotated_point.y
      assert_equal 30, @rotated_point.z
    end
  end

  describe "after projecting to 2D" do
    it "returns with the correct coordinates" do
      @projected_point = @a_point.project
      assert_equal 13.157894736842104, @projected_point.x
      assert_equal 26.31578947368421, @projected_point.y
      assert_equal 0, @projected_point.z
    end
  end

end