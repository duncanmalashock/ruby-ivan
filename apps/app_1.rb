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

y_rot = 0;
loop do
  glyph1 = Glyph.new(cube_geometry)
  buffer1 = glyph1 \
    .scale([40,40,40]) \
    .rotate_y(y_rot) \
    .project \
    .translate([128, 128, nil]) \
    .instructions
  sender1.send_buffer(buffer1)
  y_rot += 0.01
  sleep 0.01
end