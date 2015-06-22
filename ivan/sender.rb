# Sender is an abstract class, and is not meant to be instantiated.
# Subclass it for the requirements of your application's display hardware.

class Sender
  @output = nil
  def initialize(config_params)
    begin
      post_initialize(config_params)
    rescue
      raise OutputInitError, "Output device couldn't be initialized"
    end
  end

  def send_buffer(instructions)
    pre_send_buffer(instructions)
    instructions.each_slice(2) do |slice|
      send_line(slice)
    end
  end

  private

    def send_line(line)
      @output.send(output_message, coordinate_format(line[0].x))
      @output.send(output_message, coordinate_format(line[0].y))
      @output.send(output_message, coordinate_format(line[1].x))
      @output.send(output_message, coordinate_format(line[1].y))
    end

    # Override these methods in concrete subclasses

    def post_initialize(config_params)
      raise NotImplementedError
    end

    def pre_send_buffer(instructions)
      raise NotImplementedError
    end

    def output_message
      raise NotImplementedError
    end

    def coordinate_format(value)
      raise NotImplementedError
    end
end