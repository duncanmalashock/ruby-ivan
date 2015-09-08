require_relative '../spec/mocks'
require_relative '../lib/ivan'

class Box
  def render
    return [1,2,3,4,5]
  end
end

display = Ivan::Display.new(device_path: '/dev/tty.usbmodem54121')
output = Ivan::Output.new(display: display)

output.clear
output.render Box.new
output.send_to_display