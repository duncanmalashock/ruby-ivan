require 'spec_helper'

module Ivan
  describe Frame do
    let(:frame) { Frame.new }
    let(:instr_1) { [1, 2, 3] }
    let(:instr_2) { [3, 4, 5, 6] }

    describe '#initialize' do
      it 'has no instructions' do
        expect(frame.instructions).to eq([])
      end
    end

    describe '#add_instructions' do
      context 'when given a set of instructions' do
        it 'returns the number of instructions rendered' do
          result = frame.add_instructions(instr_1)
          expect(result).to eq(instr_1)
        end
      end
      context 'when called twice with two sets of instructions' do
        it 'returns the total of the instructions' do
          frame.add_instructions(instr_1)
          result = frame.add_instructions(instr_2)
          expect(result).to eq(instr_1 + instr_2)
        end
      end
    end

    describe '#clear' do
      it 'clears the frame' do
        frame.add_instructions(instr_1)
        frame.clear
        expect(frame.instructions).to eq([])
      end
    end
  end
end