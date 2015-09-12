module Ivan
  # Utilities for performing geometric transformations on
  # a Point passed in and returning a transformed Point as output
  module TransformsPoints
    def self.scale(point:, scale_amount:)
      Point.new(
        x: point.x * scale_amount,
        y: point.y * scale_amount,
        z: point.z * scale_amount
      )
    end

    def self.translate(point:, translate_amount:)
      Point.new(
        x: point.x + translate_amount[0],
        y: point.y + translate_amount[1],
        z: point.z + translate_amount[2]
      )
    end
  end
end
