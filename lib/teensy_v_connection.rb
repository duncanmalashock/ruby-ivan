# TeensyVConnection
# Adapter from Display to teensyv hardware

require 'serialport'

module Ivan
  class TeensyVConnection
    attr_reader :serial_port

    def initialize(device_path:, serial_port_class: SerialPort)
      @serial_port = serial_port_class.new(device_path, 9600, 8, 1)
    end

    def draw(instructions)
      instructions.length
    end
  end
end