require 'serialport'

module Ivan
  # Adapter from Display to scope hardware
  class DeviceConnection
    attr_reader :output_format

    def initialize(device_path:, serial_port_class: SerialPort)
      serial_port = serial_port_class.new(device_path, 9600, 8, 1)
      @output_format = Teensyv1Output.new(serial_port)
    end

    def transmit_to_device(instructions)
      @output_format.output(instructions)
      instructions.length
    end
  end
end
