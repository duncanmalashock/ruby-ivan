require_relative '../spec/mocks'
require_relative '../lib/ivan'

display = Ivan::Display.new(device_path: '/dev/tty.usbmodem54121',
  connection_type: ConnectionTypeMock)
output = Ivan::Output.new(display: display)

cube_1 = Ivan::Glyph.new(
  geometry: [1,2,3,4,5,6],
  rotation: [0,10,0])

output.clear
output.render cube_1
puts output.send_to_display