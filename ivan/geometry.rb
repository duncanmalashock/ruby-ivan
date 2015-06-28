class LineStructError < Exception
end

class LineIndexRangeError < Exception
end

Struct.new("Geometry", :points, :lines) do
  def valid?
    lines.each do |l|
      raise LineStructError, "This line is not a 2-tuple" \
        if l.length != 2
      raise LineIndexRangeError, "Line vertex with invalid point index" \
        if not points[l[0]] or not points[l[1]]
    end
  end
end