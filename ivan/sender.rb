# Sender is an abstract class. Subclass it for the requirements of
# your application's display hardware.

class DefaultOutputStub
  def default_send(value)
    "I'm a stub for an abstract class"
  end
end

class Sender
  @output = nil
  def initialize(config_params)
    begin
      post_initialize(config_params)
    rescue
      raise OutputInitError, "Output device couldn't be initialized"
    end
  end

  def post_initialize(config_params)
    @output = DefaultOutputStub.new
    true
  end

  def output_message
    :default_send
  end

  def coordinate_format(value)
    value
  end

  def send_buffer(instructions)
    pre_send_buffer(instructions)
    instructions.each_slice(2) do |slice|
      send_line(slice)
    end
  end

  def pre_send_buffer(instructions)
    true
  end

  private

    def send_line(line)
      @output.send(output_message, coordinate_format(line[0].x))
      @output.send(output_message, coordinate_format(line[0].y))
      @output.send(output_message, coordinate_format(line[1].x))
      @output.send(output_message, coordinate_format(line[1].y))
    end

end