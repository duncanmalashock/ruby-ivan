require 'spec_helper'

module Ivan
  describe DeviceConnection do
    let(:dev_conn) { DeviceConnection.new(device_path: 'valid_path',
      serial_port_class: SerialPortMock) }
    describe '#initialize' do
      it 'assigns an :output_format attr' do
        expect(dev_conn.output_format).not_to be_nil
      end
    end

    describe '#transmit_to_device' do
      context 'when called with instructions' do
        let(:a_point) { Point.new(x: 2, y: 4, z: 5) }
        it 'returns the number of points drawn' do
          expect(dev_conn.transmit_to_device([a_point,a_point])).to eq(2)
        end
      end
    end
  end
end