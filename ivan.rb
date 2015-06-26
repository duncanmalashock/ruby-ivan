require_relative 'ivan/point'
require_relative 'ivan/point_2d'
require_relative 'ivan/point_3d'
require_relative 'ivan/has_transforms'
require_relative 'ivan/glyph'
require_relative 'ivan/sender'
require_relative 'ivan/teensyv_sender'

module Ivan
  Models = {}
  def load_model(model_name)
    Models[model_name] = eval( \
      File.read("#{ File.dirname($0) }/models/#{ model_name }.txt"))
  end
  module_function :load_model
end