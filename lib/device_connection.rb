require 'serialport'

module Ivan
  # Adapter from Display to scope hardware
  class DeviceConnection
    attr_reader :serial_port

    def initialize(device_path:, serial_port_class: SerialPort)
      @serial_port = serial_port_class.new(device_path, 9600, 8, 1)
    end

    def draw(instructions)
      self.send(ConnectionMethod, instructions)
      instructions.length
    end

    private

    def teensyv_1(instructions)
      puts "sending to teensyv_1: #{instructions}"
    end
  end
end
