require 'abstract_type'

class Glyph
  include AbstractType
  abstract_method :draw
end