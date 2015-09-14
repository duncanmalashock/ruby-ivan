require 'spec_helper'

module Ivan
  describe Model do
    let(:point_collection_mock) { [1, 2, 3] }
    let(:pyramid) { Model.new(point_collection_mock) }
    describe '#initialize' do
      it 'assigns its points attr' do
        expect(pyramid.points).to eq(point_collection_mock)
      end
    end
    describe '#points' do
      it 'returns the points attr' do
        expect(pyramid.points).not_to be(nil)
      end
    end
    describe '#new_from_file' do
      it 'loads valid model data from a YAML file'
    end
    describe '#save_to_file' do
      it 'writes serialized YAML to the path'
    end
  end
end