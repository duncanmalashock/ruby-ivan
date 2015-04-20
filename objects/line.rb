class Line
  attr_accessor :start_point
  attr_accessor :end_point
  def initialize (start_point, end_point)
    @start_point = start_point
    @end_point = end_point
  end
end