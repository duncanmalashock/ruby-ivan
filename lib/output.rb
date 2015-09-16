module Ivan
  # Interface to the frame buffer and display device
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

    def render_and_send(object)
      clear
      render(object)
      send_to_display
    end
  end
end
