class Composition
  attr_reader :buffer

  def initialize(buffer)
    @buffer = buffer
  end

  def clip_to_boundary(boundary)
    @buffer.each_slice(2).with_index do |slice, i|
      index = i * 2
      clipped_points = Point.clip_to_boundary(boundary, slice)
      @buffer[index] = clipped_points[0]
      @buffer[index+1] = clipped_points[1]
    end
    @buffer.reject! {|p| !p }
    return self
  end

  def normalize(boundary)
    scale = 1.0
    trans = 127
    @buffer = @buffer.map do |point|
      point \
        .scale([scale, scale, 0])
        .translate([trans, trans, 0])
    end
    return self
  end
end