class Cube < Actor
  include Translatable
  include Rotatable
  include Scalable
  def initialize
    points = [ [-1,-1,1],
                [1,-1,1], 
                [1,1,1],
                [-1,1,1],
                [-1,1,-1],
                [1,1,-1],
                [-1,-1,-1],
                [1,-1,-1] ]
    lines = [ [points[0],points[1] ],
              [points[1],points[2] ],
              [points[2],points[3] ],
              [points[3],points[0] ],
              [points[3],points[4] ],
              [points[2],points[5] ],
              [points[1],points[7] ],
              [points[4],points[6] ],
              [points[4],points[5] ],
              [points[0],points[6] ],
              [points[6],points[7] ],
              [points[7],points[5] ]
            ]
    super(points, lines)
  end
end