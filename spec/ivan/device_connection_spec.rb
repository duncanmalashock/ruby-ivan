require 'spec_helper'

module Ivan
  describe DeviceConnection do
    let(:teensyv) { DeviceConnection.new(device_path: 'valid_path',
      serial_port_class: SerialPortMock) }
    describe '#initialize' do
      it 'assigns a :serial_port attr' do
        expect(teensyv.serial_port).not_to be_nil
        expect(teensyv.serial_port.class).to be(SerialPortMock)
      end
    end

    describe '#draw' do
      context 'when called with instructions' do
        let(:a_point) { Point.new(x: 2, y: 4, z: 5) }
        it 'returns the number of points drawn' do
          expect(teensyv.draw([a_point,a_point])).to eq(2)
        end
      end
    end
  end
end