require 'spec_helper'

module Ivan
  describe Glyph do
    let (:stub_geom) { [1, 2, 3, 4] }
    context 'when initialized with only geometry' do
      let(:cube) { Glyph.new(geometry: stub_geom) }
      describe '#initialize' do
        it 'sets geometry attr correctly' do
          expect(cube.geometry).to eq(stub_geom)
        end
        it 'has a default rotation value' do
          expect(cube.rotation).to eq([0, 0, 0])
        end
      end
      describe '#render' do
        it 'returns data for drawing' do
          expect(cube.render).to eq(stub_geom)
        end
      end
    end
    context 'when initialized with a rotation value' do
      let(:cube) { Glyph.new(
        geometry: stub_geom, 
        rotation: [10, 20, 30]) }
      describe '#initialize' do
        it 'sets rotation attr correctly' do
          expect(cube.rotation).to eq([10, 20, 30])
        end
      end
    end
    context 'when initialized with a single scale value' do
      let(:cube) { Glyph.new(
        geometry: stub_geom, 
        scale: 10) }
      describe '#initialize' do
        it 'sets scale attr correctly' do
          expect(cube.scale).to eq([10, 10, 10])
        end
      end
    end
    context 'when initialized with a tuple scale value' do
      let(:cube) { Glyph.new(
        geometry: stub_geom, 
        scale: [10, 10, 10]) }
      describe '#initialize' do
        it 'sets scale attr correctly' do
          expect(cube.scale).to eq([10, 10, 10])
        end
      end
    end
  end
end