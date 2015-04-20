require 'serialport'

class USBTeensyRenderer
  def initialize(usb_device, baud_rate)
    @sp = SerialPort.new(usb_device, baud_rate, 8, 1)
    @sp.get_modem_params()
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
  def write_coordinate_pair(start_point, end_point)
    write_byte(start_point.x.to_i)
    write_byte(start_point.y.to_i)
    write_byte(end_point.x.to_i)
    write_byte(end_point.y.to_i)
  end
  def render(instructions)
    write_16_bit_word(instructions.length)
    instructions.each { |i|
      write_coordinate_pair(i.start_point, i.end_point)
    }
  end

end
