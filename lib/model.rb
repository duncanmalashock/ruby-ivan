module Ivan
  # Collection of Points in a fixed spatial relationship
  class Model
    attr_reader :points

    def initialize(points)
      @points = points
    end
  end
end
