require_relative "minitest_helper"

describe Glyph do
  describe "when initialized correctly" do
    before do
      @cube = @object = Glyph.new(CubeFixture.geometry)
      @cube_two = @object = Glyph.new(CubeFixture.geometry)
    end

    describe "after initialization" do
      it "has the right number of instructions" do
        @cube.instructions.length.must_equal 24
      end
      it "has the correct first coordinate" do
        @cube.instructions[0].x.must_equal -1.0
        @cube.instructions[0].y.must_equal -1.0
        @cube.instructions[0].z.must_equal 1.0
      end
      it "responds to #children" do
        assert_respond_to @cube, :children
      end

      it "can compose child Glyphs with itself" do
        @cube << @cube_two
        assert_equal 48, @cube.instructions.length
      end
    end
  end
end