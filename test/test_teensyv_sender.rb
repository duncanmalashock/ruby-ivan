require_relative "minitest_helper"

describe TeensyVSender do
  before do
    @config_params = {
      output_class: TeensyVOutputDouble
    }
    @sender = TeensyVSender.new(@config_params)
  end

  describe "when initialized correctly" do
    it "sends post_initialize to itself" do
      @sender.must_be_kind_of TeensyVSender
      assert_send [@sender, :post_initialize, @config_params]
    end
  end

  describe "when sending its buffer" do
    it "sends pre_send_buffer to itself" do
      @sender.send_buffer(BufferFixture.instructions)
      assert_send [@sender, :pre_send_buffer, BufferFixture.instructions]
      assert_send [@sender, :send_line, BufferFixture.instructions[0..1]]
    end

    it "raises an error if output is unsafe" do
      proc { @sender.send_buffer(UnsafeBufferFixture.instructions) } \
        .must_raise UnsafeOutputError
    end
  end
end