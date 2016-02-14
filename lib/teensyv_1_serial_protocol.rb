module Ivan
  # Protocol for sending instructions over serial
  class TeensyV1SerialProtocol
    attr_reader :serial_port

    def initialize(serial_port)
      @serial_port = serial_port
    end

    def output(instructions)
      transmit_instruction_length(instructions.length / 2)
      instructions.each_slice(2) do |slice|
        send_line(slice)
      end
    end

    private

    def transmit_instruction_length(length)
      high_byte = (length >> 8) & 0xff
      low_byte = length & 0xff
      @serial_port.write(high_byte.to_i.chr)
      @serial_port.write(low_byte.to_i.chr)
      return length
    end

    def send_line(line)
      [line[0].x, line[0].y, line[1].x, line[1].y].each do |coord|
        @serial_port.write(coord.to_i.chr)
      end
    end
  end
end