require 'serialport'

class USBTeensySender < Sender
  def post_initialize(config_params)
    @output = SerialPort.new(
      config_params[:port], 
      config_params.fetch(:baud, 9600), 
      config_params.fetch(:data_bits, 8),
      config_params.fetch(:stop_bits, 1)
    )
  end

  def pre_send_buffer(instructions)
    transmit_instruction_length(instructions.length)
  end

  def output_message
    :write
  end

  def coordinate_format(value)
    value.to_i.chr
  end

  private

    def transmit_instruction_length(length)
      length /= 2
      high_byte = (length >> 8) & 0xff
      low_byte = length & 0xff
      @output.write(high_byte.to_i.chr)
      @output.write(low_byte.to_i.chr)
    end

end