require_relative '../ivan'

require_relative 'usb_teensy_sender'

min_val = 80
max_val = 180

square_geometry = {
  points: [ 
    [min_val, min_val],
    [min_val, max_val], 
    [max_val, max_val],
    [max_val, min_val]
  ],
  lines: [
    [0, 1],
    [1, 2],
    [2, 3],
    [3, 0]
  ]
}
actor1 = Actor.new(square_geometry)
config_params = {
  port: "/dev/tty.usbmodem54121"
}
sender1 = USBTeensySender.new(config_params)
sender1.send_buffer(actor1.instructions)