require 'spec_helper'

describe Compositor do
  let(:renderer) { renderer = StubRenderer }
  let(:comp) { comp = Compositor.new(renderer, [0, 0, 255, 255]) }

  context 'when instantiated with correct parameters' do
    it 'has a bounding rectangle' do
      expect(comp.bounding_box).to eq([0, 0, 255, 255])
    end
    it 'has a renderer' do
      expect(comp.renderer.class).to eq(renderer)
    end
    it 'has an empty array of drawing instructions' do
      expect(comp.drawing_instructions).to eq([])
    end
  end

  context 'when one drawing instruction is added' do
    before do
      comp.add_instruction(Line.new( TwoDPoint.new(20, 20),TwoDPoint.new(40, 40) ))
    end
    it 'has a length of one' do
      expect(comp.drawing_instructions.length).to eq(1)
    end
    it 'has an instruction of class Line' do
      expect(comp.drawing_instructions[0].class).to eq(Line)
    end

    context 'when one drawing instruction is added and drawing instructions are cleared' do
      before do
        comp.clear_instructions
      end
      it 'has a length of zero' do
        expect(comp.drawing_instructions.length).to eq(0)
      end
    end
  end

end