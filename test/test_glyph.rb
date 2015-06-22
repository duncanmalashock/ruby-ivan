require_relative "minitest_helper"

describe Glyph do
  describe "when initialized correctly" do
    before do
      @cube = @object = Glyph.new(CubeFixture.geometry)
    end

    describe "after initialization" do
      include SpatialInterfaceTest
      it "has the right number of instructions" do
        assert_equal 24, @cube.instructions.length
      end
      it "has the correct first coordinate" do
        assert_equal -1.0, @cube.instructions[0].x
        assert_equal -1.0, @cube.instructions[0].y
        assert_equal 1.0, @cube.instructions[0].z
      end
      it "responds to the Spatial interface" do
        test_implements_spatial_interface
      end
    end
  end
end