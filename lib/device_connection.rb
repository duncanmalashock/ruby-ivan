require 'serialport'

module Ivan
  # Adapter from Display to scope hardware
  class DeviceConnection
    attr_reader :serial_port, :output_method

    def initialize(device_path:, serial_port_class: SerialPort)
      @serial_port = serial_port_class.new(device_path, 9600, 8, 1)
      @output_method = Teensyv1Output.new(@serial_port)
    end

    def draw(instructions)
      @output_method.output(instructions)
      instructions.length
    end
  end
end
