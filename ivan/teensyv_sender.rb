require 'serialport'

class TeensyVSender < Sender

  private

    def post_initialize(config_params)
      @output = config_params.fetch(:output_class, SerialPort).new(
        config_params[:port], 
        config_params.fetch(:baud, 9600), 
        config_params.fetch(:data_bits, 8),
        config_params.fetch(:stop_bits, 1)
      )
      @boundary = config_params.fetch(:boundary, {
        x_min: 0,
        y_min: 0,
        x_max: 255,
        y_max: 255
      })
    end

    def pre_send_buffer(buffer)
      transmit_instruction_length(buffer.length / 2)
    end

    def output_message
      return :write
    end

    def coordinate_format(value)
      return value.to_i.chr
    end

    def transmit_instruction_length(length)
      high_byte = (length >> 8) & 0xff
      low_byte = length & 0xff
      @output.write(high_byte.to_i.chr)
      @output.write(low_byte.to_i.chr)
      return length
    end
end