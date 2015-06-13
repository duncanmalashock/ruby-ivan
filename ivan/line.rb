class Line
  attr_accessor :points
  def initialize (start_point, end_point)
    @points = [start_point, end_point]
  end

  def clip(viewport=[-1,-1, 1, 1])
    output = points.clone
    output.each do |p|
      if p[0] < viewport[0]
        output[0][0] = viewport[0]
      end
      if p[1] < viewport[1]
        output[0][1] = viewport[1]
      end
      if p[0] > viewport[0]
        output[1][0] = viewport[2]
      end
      if p[1] > viewport[1]
        output[1][1] = viewport[3]
      end
    end

    output
  end
end
