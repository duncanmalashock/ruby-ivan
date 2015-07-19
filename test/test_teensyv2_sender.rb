require_relative "minitest_helper"

describe TeensyV2Sender do
  before do
    @sender = TeensyV2Sender.new({})
  end
  describe ".initialize" do
    it "should be truthy" do
      assert @sender
    end
  end
  describe ".boundary" do
    it "should return the correct boundary" do
      assert_equal ({ x_min: 0, y_min: 0, x_max: 2047, y_max: 2047 }), @sender.boundary
    end
  end
  # describe ".send" do
  #   it "should start with a reset command" do
  #     assert_equal 0x000000000000000000000000, @sender.send(BufferFixture.to_buffer)
  #   end
  # end
end