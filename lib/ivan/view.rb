class View
  attr_accessor :lines
  def initialize(actor)
    actor.points.each do |l|
      l[0] = scale( l[0] + l[2]*0.5 )
      l[1] = scale( l[1] + l[2]*0.5 )
      l.pop
    end
    self.lines = actor.lines
  end

  private 

    def scale(in_val)
      out_val = ((in_val + 2.1) * 50).floor
      if out_val <= 0
        return 0
      elsif out_val >= 255
        return 255
      end
      return out_val
    end
end