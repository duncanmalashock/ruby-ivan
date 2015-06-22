module CubeFixture
  def self.geometry
    {
      points: [ 
        [-1,-1,1],
        [1,-1,1], 
        [1,1,1],
        [-1,1,1],
        [-1,1,-1],
        [1,1,-1],
        [-1,-1,-1],
        [1,-1,-1]
      ],
      lines: [
        [0, 1],
        [1, 2],
        [2, 3],
        [3, 0],
        [3, 4],
        [2, 5],
        [1, 7],
        [4, 6],
        [4, 5],
        [0, 6],
        [6, 7],
        [7, 5]
      ]
    }
  end
end

class PointStub
  def x
    10
  end
  def y
    20
  end
  def z
    nil
  end
end

module BufferFixture
  def self.instructions
    [
      PointStub.new,
      PointStub.new,
      PointStub.new,
      PointStub.new,
    ]
  end
end
