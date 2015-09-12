require 'spec_helper'

module Ivan
  describe Point do
    context 'when initialized with coordinate values' do
      let(:a_point) { Point.new(x: 2, y: 4, z: 5) }
      describe '#x' do
        it "has a non-nil value" do
          expect(a_point.x).not_to be(nil)
        end
      end
      describe '#y' do
        it "has a non-nil value" do
          expect(a_point.y).not_to be(nil)
        end
      end
      describe '#z' do
        it "has a non-nil value" do
          expect(a_point.z).not_to be(nil)
        end
      end
    end
    context 'when initialized with no values' do
      let(:a_point) { Point.new }
      describe '#x' do
        it "has the default 0 value" do
          expect(a_point.x).to eq(0)
        end
      end
      describe '#y' do
        it "has the default 0 value" do
          expect(a_point.y).to eq(0)
        end
      end
      describe '#z' do
        it "has the default 0 value" do
          expect(a_point.z).to eq(0)
        end
      end
    end
  end
end