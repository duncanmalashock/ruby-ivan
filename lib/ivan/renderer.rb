class Renderer
  def initialize(serial_port_class: SerialPort)
    begin
      @sp = serial_port_class.new("/dev/tty.usbmodem54121", 9600, 8, 1)
    rescue
      raise USBInitError, "USB output couldn't be initialized"
    end
    @sp.get_modem_params()
  end

  def render(instructions)
    transmit_instruction_length(instructions.length)
    instructions.each { |i|
      render_line(i)
    }
  end

  private

    def transmit_instruction_length(length)
      write_16_bit_word(length)
    end

    def render_line(line)
      write_byte(line[0][0].to_i)
      write_byte(line[0][1].to_i)
      write_byte(line[1][0].to_i)
      write_byte(line[1][1].to_i)
    end

    def write_byte(the_byte)
      @sp.write(the_byte.to_i.chr)
    end

    def write_16_bit_word(the_word)
      high_byte = (the_word >> 8) & 0xff
      low_byte = the_word & 0xff
      write_byte(high_byte)
      write_byte(low_byte)
    end

end