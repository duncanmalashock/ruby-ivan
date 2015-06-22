class Glyph
  include Spatial

  def initialize(geometry)
    @points = geometry[:points].map do |p|
      Point.new(*p)
    end
    @lines = geometry[:lines]
  end

  def instructions
    my_instructions = []
    @lines.each do |l|
      l.each do |p|
        my_instructions << @points[p]
      end
    end
    my_instructions
  end

end  