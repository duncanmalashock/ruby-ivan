require 'spec_helper'

module Ivan
  describe Model do
    let(:point_collection_mock) { [1, 2, 3] }
    let(:shape_1) { Model.new(point_collection_mock) }
    describe '#initialize' do
      it 'assigns its points attr' do
        expect(shape_1.points).to eq(point_collection_mock)
      end
    end
    describe '#points' do
      it 'returns the points attr' do
        expect(shape_1.points).not_to be(nil)
      end
    end
    describe '#new_from_file' do
      it 'loads valid model data from a YAML file' do
        yaml = YAML.load_file('spec/fixtures/simple_model.yml')
        new_model = Model.new_from_yaml(yaml)
        expect(new_model.points).not_to be(nil)
      end
    end
  end
end