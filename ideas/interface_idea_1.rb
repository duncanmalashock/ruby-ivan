# ------- IDEAS FOR IVAN'S PUBLIC INTERFACE --------

# 1) RENDER OBJECTS "A LA CARTE"

display = Ivan::Display.new(device_path: '/dev/tty.usbmodem54121')
output = Ivan::Output.new(display)

camera_1 = Ivan::Camera.new(
  position: [0,0,-152],
  rotation: [0, 10, 0],
  focal_length: 300)
cube_1 = Ivan::Glyph.new(
  model: Ivan::Model.from_file("cube.yml"),
  scale: 20,
  rotation: [4,68,0])

output.clear
output.camera = camera_1
output.render cube_1
output.send_to_display


# 2) OR RENDER A KEYFRAME ANIMATION

display = Ivan::Display.new(device_path: '/dev/tty.usbmodem54121')
output = Ivan::Output.new(display)
a = Animation.new(file: "cube_bounce.yml")

output.clear
output.render(a.frame(34))
output.send_to_display


# 2a) OR COMBINE #clear, #render, #send_to_display WITH A HELPER METHOD

display = Ivan::Display.new(device_path: '/dev/tty.usbmodem54121')
output = Ivan::Output.new(display)
a = Animation.new(file: "cube_bounce.yml")

output.render_and_send(a.frame(34))