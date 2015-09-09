require 'spec_helper'

module Ivan
  describe Glyph do
    let (:stub_point) { PointMock.new }
    let (:stub_geom) { GeometryMock.new }
    context 'when initialized with only geometry' do
      let(:cube) { Glyph.new(geometry: stub_geom) }
      describe '#initialize' do
        it 'sets geometry attr correctly' do
          expect(cube.geometry).to eq(stub_geom)
        end
        it 'has a default rotation value' do
          expect(cube.rotation).to eq([0, 0, 0])
        end
        it 'has a default position value' do
          expect(cube.position).to eq([0, 0, 0])
        end
      end
      describe '#render' do
        it 'returns rendered points equal to its geometry attr' do
          expect(cube.render[0].x).to eq(stub_geom.points[0].x)
          expect(cube.render[0].y).to eq(stub_geom.points[0].y)
          expect(cube.render[0].z).to eq(stub_geom.points[0].z)
        end
      end
    end
    context 'when initialized with a position value' do
      let(:cube) { Glyph.new(
        geometry: stub_geom, 
        position: [30, 20, 10]) }
      describe '#initialize' do
        it 'sets position attr correctly' do
          expect(cube.position).to eq([30, 20, 10])
        end
      end
      describe '#render' do
        it 'transforms the points to the position' do
          expect(cube.geometry).to receive(:scale)
          cube.render
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