require_relative '../ivan'

config_params = {
  port: "/dev/tty.usbmodem54121"
}
sender1 = TeensyVSender.new(config_params)

cube_geometry = {
  points: [ 
    [-1,-1,1],
    [1,-1,1], 
    [1,1,1],
    [-1,1,1],
    [-1,1,-1],
    [1,1,-1],
    [-1,-1,-1],
    [1,-1,-1]
  ],
  lines: [
    [0, 1],
    [1, 2],
    [2, 3],
    [3, 0],
    [3, 4],
    [2, 5],
    [1, 7],
    [4, 6],
    [4, 5],
    [0, 6],
    [6, 7],
    [7, 5]
  ]
}

alphabet = {
  a: {
    points: [ 
      [0,0],
      [0,8], 
      [4,12], 
      [8,8],
      [8,0],
      [0,4],
      [8,4]
    ],
    lines: [
      [0, 1],
      [1, 2],
      [2, 3],
      [3, 4],
      [5, 6]
    ]
  }
}

glyph1 = Glyph.new(alphabet[:a])
buffer1 = glyph1 \
  .translate([-6, -6, nil]) \
  .scale([8, 8, nil]) \
  .rotate_y(0.03) \
  .rotate_z(0.2) \
  .project \
  .translate([128, 128, nil]) \
  .instructions
sender1.send_buffer(buffer1)
