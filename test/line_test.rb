require "minitest_helper"

describe Line do
  before do
    @line = Line.new([-2.0, -2.0], [2.0, 2.0])
  end

  describe "when asked for its points" do
    it "should return an array of 2 points" do
      @line.points.length.must_equal(2)
    end
  end

  describe "when asked to clip its endpoints" do
    it "should project its endpoints onto the viewport boundary" do
      @line.clip.must_equal([[-1, -1], [1, 1]])
    end
  end
end
