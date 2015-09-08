require 'spec_helper'

module Ivan
  describe Glyph do
    context "when initialized with only geometry" do
      let(:cube) { Glyph.new(geometry: [1,2,3,4]) }
      describe "#initialize" do
        it "sets geometry attr correctly" do
          expect(cube.geometry).to eq([1,2,3,4])
        end
        it "has a default rotation value" do
          expect(cube.rotation).to eq([0,0,0])
        end
      end
      describe "#render" do
        it "returns data for drawing" do
          expect(cube.render).to eq([1,2,3,4])
        end
      end
    end
    context "when initialized with a rotation value" do
      let(:cube) { Glyph.new(
        geometry: [1,2,3,4],
        rotation: [10,20,30]) }
      it "sets rotation attr correctly" do
        expect(cube.rotation).to eq([10,20,30])
      end
    end
  end
end