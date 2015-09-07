# Display
# Creates a connection to a display device to which instructions can be sent

module Ivan
  class Display
    attr_reader :connection

    def initialize(device_path:, connection_type: TeensyVConnection)
      if (valid_device_path?(device_path))
        @connection = connection_type.new(device_path: device_path)
      else
        return nil
      end
    end

    def send_instructions(instructions)
      connection.draw(instructions)
    end

    private

    def valid_device_path?(device_path)
      return !device_path.empty?
    end
  end
end