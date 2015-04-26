require_relative 'ivan/version'

require 'serialport'

require_relative 'ivan/view/compositor.rb'
require_relative 'ivan/view/renderers/usb_teensy_renderer.rb'
require_relative 'ivan/view/renderers/stub_renderer.rb'
require_relative 'ivan/objects/2d_point.rb'
require_relative 'ivan/objects/line.rb'

module Ivan
end