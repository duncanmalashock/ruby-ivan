require 'spec_helper'

module Ivan
  describe Frame do
    let (:frame) { Frame.new }
    let (:object_1) { double(render: [1, 2, 3]) }
    let (:object_2) { double(render: [3, 4, 5, 6]) }

    describe '#initialize' do
      it 'has no instructions' do
        expect(frame.instructions).to eq([])
      end
    end

    describe '#render' do
      context 'when given an unrenderable object' do
        it 'returns nil' do
          result = frame.render(nil)
          expect(result).to eq(nil)
        end
      end
      context 'when given a renderable object' do
        it 'returns the number of instructions rendered' do
          result = frame.render(object_1)
          expect(result).to eq([1, 2, 3])
        end
      end
      context 'when called twice with two renderable objects' do
        it 'returns the sum of the instructions' do
          frame.render(object_1)
          result = frame.render(object_2)
          expect(result).to eq(object_1.render + object_2.render)
        end
      end
    end

    describe '#clear' do
      it 'clears the frame' do
        frame.render(object_1)
        frame.clear
        expect(frame.instructions).to eq([])
      end
    end
  end
end