require 'yaml'

module Ivan
  # Collection of Points in a fixed spatial relationship
  class Model
    attr_reader :points

    def initialize(points)
      @points = points
    end

    def self.new_from_file(filename)
      loaded_model = YAML.load_file(filename)
      loaded_points = loaded_model['points']
      points = loaded_points.map do |p|
        Point.new(x: p['x'], y: p['y'], z: p['z'])
      end
      Model.new(points)
    end
  end
end
