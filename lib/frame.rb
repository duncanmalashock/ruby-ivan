module Ivan
  # Maintains a list of drawing instructions to be written to the display
  class Frame
    attr_reader :instructions

    def initialize
      clear
    end

    def add_instructions(instructions)
      @instructions += instructions
    end

    def clear
      @instructions = []
    end
  end
end
