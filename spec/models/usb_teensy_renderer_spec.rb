require 'spec_helper'

# Not sure how to do these tests independent of hardware

describe USBTeensyRenderer do 
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