require_relative "minitest_helper"

describe Sender do
  before do
    @config_params = {
      param1: "default"
    }
    @sender = Sender.new(@config_params)
  end

  describe "when initialized correctly" do
    it "sends post_initialize to itself" do
      assert_kind_of Sender, @sender
      assert_send [@sender, :post_initialize, @config_params]
    end
    it "responds to output_message" do
      assert_respond_to @sender, :output_message
    end
    it "responds to coordinate_format" do
      assert_respond_to @sender, :coordinate_format
    end
  end

  describe "when sending its buffer" do
    it "sends pre_send_buffer to itself" do
      @sender.send_buffer(BufferFixture.instructions)
      assert_send [@sender, :pre_send_buffer, BufferFixture.instructions]
    end
    it "sends send_line to itself" do
      assert_send [@sender, :send_line, BufferFixture.instructions[0..1]]
    end
  end
end