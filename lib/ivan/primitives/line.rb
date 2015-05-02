class Line
  attr_accessor :points
  def initialize (start_point, end_point)
    @points = [start_point, end_point]
  end
end
