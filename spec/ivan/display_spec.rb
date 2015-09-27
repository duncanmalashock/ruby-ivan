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
        result = display.send_instructions([Point.new(x: -100, y: -100, z: 0)])
      end
      it 'returns the number of instructions drawn' do
        result = display.send_instructions([Point.new(x: -100, y: -100, z: 0)])
        expect(result).to be(1)
      end
      let(:instructions) do
        [
          Point.new(x: -100, y: -100, z: 0),
          Point.new(x: 100, y: 100, z: 0)
        ]
      end
      it 'adjusts scale of points drawn to fit its output boundary' do
        expect(display.connection).to receive(:draw) do |ins|
          expect(ins[0].x).to eq(0)
          expect(ins[0].y).to eq(0)
          expect(ins[1].x).to eq(255)
          expect(ins[1].y).to eq(255)
        end
        result = display.send_instructions(instructions)
      end
      it 'clips lines outside its input boundary'
    end
  end
end