class Point
  attr_accessor :x, :y, :z
  def initialize (x, y, z = nil)
    @x = x;
    @y = y;
    @z = z;
  end

  def three_d?
    return !@z.nil?
  end

  def screen_safe?(boundary)
    return false if (@x < boundary[:x_min] || @x > boundary[:x_max])
    return false if (@y < boundary[:y_min] || @y > boundary[:y_max])
    return false if self.three_d?
    return true
  end
end
