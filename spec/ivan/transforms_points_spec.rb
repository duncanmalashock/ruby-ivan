require 'spec_helper'

module Ivan
  describe TransformsPoints do
    let(:a_point) { double('point', x: 1, y: 2, z: 3) }

    describe '#scale' do
      it 'returns a point with scaled x, y, and z values' do
        result = TransformsPoints.scale(
          point: a_point,
          scale_amount: [10, 10, 10])
        expect(result.x).to eq(10)
        expect(result.y).to eq(20)
        expect(result.z).to eq(30)
      end
    end

    describe '#translate' do
      it 'returns a point with translated x, y, and z values' do
        result = TransformsPoints.translate(
          point: a_point,
          translate_amount: [10, 10, 10])
        expect(result.x).to eq(11)
        expect(result.y).to eq(12)
        expect(result.z).to eq(13)
      end
    end
  end
end