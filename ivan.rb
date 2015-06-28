require 'yaml'

require_relative 'ivan/point'
require_relative 'ivan/point_2d'
require_relative 'ivan/point_3d'
require_relative 'ivan/has_transforms'
require_relative 'ivan/geometry'
require_relative 'ivan/glyph'
require_relative 'ivan/sender'
require_relative 'ivan/teensyv_sender'

module Ivan
  @model_path = nil
  @default_focal_length = -125.0
  Models = {}
  
  def set_model_path(path)
    @model_path = path
  end

  def default_focal_length
    return @default_focal_length
  end

  def load_model(model_name)
    model_file = File.read("#{ @model_path }/#{ model_name }.yml")
    if model_file then
      geom = YAML.load(model_file)
      if geom.valid? then
        Models[model_name] = geom
      end
    end
  end

  def copy_model(source, destination)
    if Models[source] then
      Models[destination] = Models[source]
    end
  end

  def save_model(model_name)
    yaml_out = YAML.dump(Models[model_name])
    if yaml_out then
      file_out = File.open("#{ @model_path }/#{model_name}.yml","w")
      file_out << yaml_out
      file_out.close
    end
  end
  
  module_function :set_model_path, :load_model, :copy_model, :save_model,
    :default_focal_length
end