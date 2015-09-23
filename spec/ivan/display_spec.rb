require 'spec_helper'

module Ivan
  describe Display do

    let(:display) { Display.new(device_path: 'valid_path',
      connection_type: ConnectionMock) }

    it 'has input and output boundaries' do
      expect(display.input_boundary).not_to be(nil)
      expect(display.output_boundary).not_to be(nil)
    end

    describe '#initialize' do
      context 'when given a valid device path' do
        it 'creates a connection to a device' do
          expect(display.connection).to be_truthy
        end
      end

      context 'when given an invalid device path' do
        let(:bad_display) { Display.new(device_path: '',
          connection_type: ConnectionMock) }
        it 'has a nil connection attribute' do
          expect(bad_display.connection).to be nil
        end
      end
    end

    describe '#send_instructions' do
      it 'sends instructions to the device' do
        expect(display.connection).to receive(:draw)
        result = display.send_instructions(['some instructions!'])
      end
      it 'returns the number of instructions drawn' do
        result = display.send_instructions(['some instructions!'])
        expect(result).to be(1)
      end
      it 'adjusts scale of points drawn to fit its output boundary'
      it 'clips lines outside its input boundary'
    end
  end
end