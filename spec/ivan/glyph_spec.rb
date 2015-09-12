require 'spec_helper'

module Ivan
  describe Glyph do
    let(:stub_model) { double('model_mock') }
    context 'when initialized with only model' do
      let(:cube) { Glyph.new(model: stub_model) }
      describe '#initialize' do
        it 'sets model attr correctly' do
          expect(cube.model).to eq(stub_model)
        end
        it 'has a default rotation value' do
          expect(cube.rotation).to eq([0, 0, 0])
        end
        it 'has a default position value' do
          expect(cube.position).to eq([0, 0, 0])
        end
      end
      describe '#render' do
        it 'calls #points on its model attr' do
          expect(cube.model).to receive(:points)
          cube.render
        end
      end
    end
    context 'when initialized with a position value' do
      let(:cube) { Glyph.new(
        model: stub_model, 
        position: [30, 20, 10]) }
      describe '#initialize' do
        it 'sets position attr correctly' do
          expect(cube.position).to eq([30, 20, 10])
        end
      end
    end
    context 'when initialized with a rotation value' do
      let(:cube) { Glyph.new(
        model: stub_model, 
        rotation: [10, 20, 30]) }
      describe '#initialize' do
        it 'sets rotation attr correctly' do
          expect(cube.rotation).to eq([10, 20, 30])
        end
      end
    end
    context 'when initialized with a single scale value' do
      let(:cube) { Glyph.new(
        model: stub_model, 
        scale: 10) }
      describe '#initialize' do
        it 'sets scale attr correctly' do
          expect(cube.scale).to eq([10, 10, 10])
        end
      end
    end
    context 'when initialized with a tuple scale value' do
      let(:cube) { Glyph.new(
        model: stub_model, 
        scale: [10, 10, 10]) }
      describe '#initialize' do
        it 'sets scale attr correctly' do
          expect(cube.scale).to eq([10, 10, 10])
        end
      end
    end
  end
end