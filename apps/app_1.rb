require_relative '../ivan'

config_params = {
  port: "/dev/tty.usbmodem54121"
}
sender1 = TeensyVSender.new(config_params)

star_geometry = {
  points: [ 
    [45, 0],
    [128, 255],
    [210, 0],
    [0, 165],
    [255,165]
  ],
  lines: [
    [0, 1],
    [1, 2],
    [2, 3],
    [3, 4],
    [4, 0]
  ]
}

z_rot = -0.6
loop do
  z_rot += 0.01
  glyph1 = Glyph.new(star_geometry)
  sender1.send_buffer(glyph1 \
    .translate([-128, -128, nil]) \
    .scale([0.5, 0.5, nil]) \
    .rotate_z(z_rot) \
    .translate([128, 128, nil]) \
    .instructions)
  sleep 0.001
end