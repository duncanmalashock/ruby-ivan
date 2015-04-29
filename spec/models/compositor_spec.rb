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

end