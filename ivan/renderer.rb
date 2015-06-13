class Renderer
  def initialize(serial_port_class: SerialPort)
    begin
      @sp = serial_port_class.new("/dev/tty.usbmodem54121", 9600, 8, 1)
    rescue
      raise USBInitError, "USB output couldn't be initialized"
    end
    @sp.get_modem_params()
  end

  def render(view)
    # puts view.class
    # puts view.inspect
    points = view.points.clone
    lines = view.lines.clone
    points = scale_points(points)
    # lines = clip_lines(lines)
    transmit_instruction_length(lines.length)
    lines.each do |l|
      render_line(
        [
          [clip(l[0][0]), clip(l[0][1])],
          [clip(l[1][0]), clip(l[1][1])]
        ])
    end
  end

  private

    def scale_points(points)
      scale_factor = 128.0
      points.each do |p|
        p[0] = p[0] * scale_factor + 128.0
        p[1] = p[1] * scale_factor + 128.0
        p[2] = p[2] * scale_factor + 128.0
      end
      return points
    end

    def clip_lines(lines)
      lines.each do |l|
        if l[0][0] < 0
          lines.delete(l)
        end
      end
      return lines
    end

    def clip(in_val)
      if (in_val.infinite?)
        in_val = 0
      end
      out_val = in_val.floor
      if out_val <= 0
        return 0
      elsif out_val >= 255
        return 255
      end
      return out_val
    end

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