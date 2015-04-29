class Cube < SceneObject
  def initialize
    @points = [ Point.new([1.0, 1.0, 1.0]),
                Point.new([-1.0, 1.0, 1.0]),
                Point.new([-1.0, 1.0,-1.0]),
                Point.new([-1.0, -1.0, -1.0]),
                Point.new([1.0, -1.0, 1.0]),
                Point.new([-1.0, -1.0, 1.0]),
                Point.new([-1.0, -1.0, -1.0]),
                Point.new([-1.0, 1.0, -1.0]) ]
    @segments = [ Line.new( @points[0], @points[1] ),
                  Line.new( @points[1], @points[2] ),
                  Line.new( @points[2], @points[3] ),
                  Line.new( @points[3], @points[0] ),
                  Line.new( @points[4], @points[5] ),
                  Line.new( @points[5], @points[6] ),
                  Line.new( @points[6], @points[7] ),
                  Line.new( @points[7], @points[4] ) ]
  end
end
