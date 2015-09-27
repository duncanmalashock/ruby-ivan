module Ivan
  # Creates a connection to a display device to which instructions can be sent
  class Display
    attr_reader :connection, :input_boundary, :output_boundary

    def initialize(device_path:, connection_type: DeviceConnection,
          input_boundary: {
            x_min: -100.0,
            y_min: -100.0,
            x_max: 100.0,
            y_max: 100.0
          },
          output_boundary: {
            x_min: 0,
            y_min: 0,
            x_max: 255,
            y_max: 255
          })
      if valid_device_path?(device_path)
        @connection = connection_type.new(device_path: device_path)
        @input_boundary = input_boundary
        @output_boundary = output_boundary
      else
        return nil
      end
    end

    def send_instructions(instructions)
      converted_instructions = instructions.map do |i|
        Point.new(
          x: ((i.x + 100) * (255.0 / 200.0)).round,
          y: ((i.y + 100) * (255.0 / 200.0)).round)
      end
      connection.draw(converted_instructions)
    end

    private

    def valid_device_path?(device_path)
      !device_path.empty?
    end
  end
end
