require 'spec_helper'

module Ivan
  describe Glyph do
    let(:stub_model) { double('model_mock', points: [
        Point.new(x: -100, y: -100, z: 0),
        Point.new(x: 100, y: 100, z: 0),
        Point.new(x: -100, y: -100, z: 0)
      ]) }
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
          expect(TransformsPoints).to receive(:scale).at_least(:once)
          expect(TransformsPoints).to receive(:translate).at_least(:once)
          cube.render
        end

        let(:child_cube) { Glyph.new(model: stub_model) }
        it 'collects its children glyphs at render time' do
          cube.add_child(child_cube)
          result = cube.render
          expect(result.length).to eq(6)
      end
      it 'takes a camera argument and renders from that point of view'
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

    describe '#scale=' do
      let(:cube) { Glyph.new(model: stub_model) }
      context 'when called with a single value' do
        it 'sets scale attr correctly' do
          cube.scale = 20
          expect(cube.scale).to eq([20, 20, 20])
        end
      end
      context 'when called with a tuple value' do
        it 'sets scale attr correctly' do
          cube.scale = [10, 20, 30]
          expect(cube.scale).to eq([10, 20, 30])
        end
      end
    end

    describe '#children' do
      let(:cube) { Glyph.new(model: stub_model) }
      it 'is not nil' do
        expect(cube.children).not_to be(nil)
      end
    end
    
    describe '#add_child' do
      let(:cube) { Glyph.new(model: stub_model) }
      let(:child_cube) { Glyph.new(model: stub_model) }
      it 'adds child glyphs' do
        expect(cube.children.length).to eq(0)
        cube.add_child(child_cube)
        expect(cube.children.length).to eq(1)
      end
    end
  end
end
