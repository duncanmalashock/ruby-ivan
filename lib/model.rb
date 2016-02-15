module Ivan
  # Collection of Points in a fixed spatial relationship
  class Model
    attr_reader :points

    def initialize(points)
      @points = points
    end

    def self.new_from_yaml(yaml)
      points = yaml['points'].map do |p|
        Point.new(x: p['x'], y: p['y'], z: p['z'])
      end
      Model.new(points)
    end
  end
end
