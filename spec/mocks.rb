class ConnectionMock
  def initialize(device_path:)
  end
  def draw(instructions)
    return instructions.length
  end
end

class SerialPortMock
  def initialize(device_path, baud_rate, data_bits, stop_bits)
  end
  def write(commands)
  end
end