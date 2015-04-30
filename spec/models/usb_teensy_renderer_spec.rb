require 'spec_helper'

# Not sure how to do these tests independent of hardware

describe USBTeensyRenderer do

  let(:serial_port_class_stub) { double(:serial_port_class, new: serial_port_instance) }
  let(:serial_port_instance) { double(:serial_port_instance, get_modem_params: nil) }

  context "#initialize" do

    it "passes the correct arguments to the serial port initializer" do
      expect(serial_port_class_stub).to receive(:new).with("/dev/tty.usbmodem54121", 9600, 8, 1).and_return(serial_port_instance)
      USBTeensyRenderer.new(serial_port_class: serial_port_class_stub)
    end

    it "sets up the modem connection" do
      expect(serial_port_instance).to receive(:get_modem_params)
      USBTeensyRenderer.new(serial_port_class: serial_port_class_stub)
    end
  end

  it 'instantiates correctly' do
    # renderer = USBTeensyRenderer.new
    # expect(renderer).to be_instance_of(USBTeensyRenderer)
  end
  context 'when the correct USB port name is not present' do
    it 'raises an error on instantiation' do
      # expect { renderer = USBTeensyRenderer.new }.to raise_error(USBInitError)
    end
  end
end
