class ConnectionTypeMock
  def initialize(device_path:)
  end
  def draw(instructions)
    return instructions.length
  end
end

class SerialPortMock
  def initialize(device_path, baud_rate, data_bits, stop_bits)
  end
end

class PointMock
  def x
    1
  end
  def y
    2
  end
  def z
    3
  end
  def scale
    self
  end
end

class GeometryMock
  def points
    [PointMock.new, PointMock.new]
  end
  def scale(scale_amount)
    return points
  end
end