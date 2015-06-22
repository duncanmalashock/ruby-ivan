require_relative "minitest_helper"

describe Glyph do
  before do
    @cube = Glyph.new(CubeFixture.geometry)
  end

  describe "when initialized" do
    it "has the right number of instructions" do
      assert_equal 24, @cube.instructions.length
    end
    it "has the correct first coordinate" do
      assert_equal -1.0, @cube.instructions[0].x
      assert_equal -1.0, @cube.instructions[0].y
      assert_equal 1.0, @cube.instructions[0].z
    end
    it "plays the role of Spatial" do
      # Test that Glyph plays the Spatial role later!
    end
  end

end