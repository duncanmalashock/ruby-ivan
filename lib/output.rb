# Output
# Hides the frame buffer and display device

module Ivan
  class Output
    attr_reader :frame, :display

    def initialize(frame: Frame.new, display:)
      @frame = frame
      @display = display
    end

    def render(object)
      @frame.render(object)
    end

    def send_to_display
      @display.send_instructions(@frame.instructions)
    end

    def clear
      @frame.clear
    end
  end
end