require 'spec_helper'

module Ivan
  describe Display do
    describe '#initialize' do
      context 'when given a valid device path' do
        let (:display) { Display.new(device_path: 'valid_path',
          connection_type: ConnectionTypeMock) }
        it 'creates a connection to a device' do
          expect(display.connection).to be_truthy
        end
      end

      context 'when given an invalid device path' do
        let (:display) { Display.new(device_path: '',
          connection_type: ConnectionTypeMock) }
        it 'has a nil connection attribute' do
          expect(display.connection).to be nil
        end
      end
    end

    describe '#send_instructions' do
      let (:display) { Display.new(device_path: 'valid_path',
        connection_type: ConnectionTypeMock) }
      it 'sends instructions to the device' do
        expect(display.connection).to receive(:draw)
        result = display.send_instructions(['some instructions!'])
      end
      it 'returns the number of instructions drawn' do
        result = display.send_instructions(['some instructions!'])
        expect(result).to be(1)
      end
    end
  end
end