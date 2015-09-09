require 'spec_helper'

module Ivan
  describe Geometry do
    let(:point_collection_mock) { [1, 2, 3] }
    let(:pyramid) { Geometry.new(point_collection_mock) }
    describe '#initialize' do
      it 'assigns its points attr' do
        expect(pyramid.points).to eq(point_collection_mock)
      end
    end
    describe '#render' do
      it 'renders the points attr' do
        expect(pyramid.render).to eq(pyramid.points)
      end
    end
  end
end