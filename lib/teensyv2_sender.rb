require 'serialport'

class MockOutput
  def write(value)
    return value.to_s.unpack("c")
  end
end

class TeensyV2Sender < Sender

  def pre_send(buffer)
  end

  def send_line(line)
    [[line[0].x, line[0].y], [line[1].x, line[1].y]].each do |xcoord, ycoord|
      @output.send(output_message, coordinate_format(xcoord, ycoord) )
    end
  end

  private
    def post_initialize(config_params)
      @output = MockOutput.new

      @boundary = config_params.fetch(:boundary, {
        x_min: 0,
        y_min: 0,
        x_max: 2047,
        y_max: 2047
      })
    end

    def output_message
      :write
    end

    def coordinate_format(x, y)
      x + y
    end
end