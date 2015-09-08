require 'spec_helper'

module Ivan
  describe TeensyVConnection do
    let(:teensyv) { TeensyVConnection.new(device_path: 'valid_path',
      serial_port_class: SerialPortMock) }
    describe "#initialize" do
      it "assigns a :serial_port attr" do
        expect(teensyv.serial_port).not_to be_nil
        expect(teensyv.serial_port.class).to be(SerialPortMock)
      end
    end

    describe "#draw" do
      context "when called with instructions" do
        it "returns the number of instructions drawn" do
          expect(teensyv.draw([1,2,3])).to eq(3)
        end
      end
    end
  end
end