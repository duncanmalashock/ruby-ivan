require 'ivan'

the_renderer = USBTeensyRenderer.new("/dev/tty.usbmodem54121", 9600)
the_screen = Screen.new(the_renderer, 255, 255)

the_lines = []

radius = 120
center_x = 127
center_y = 127
num_vertices = 600
i = 0.0
circle_vertices = []
num_vertices.times do
  circle_vertices << TwoDPoint.new(center_x + (Math.cos(i) * radius), 
                        center_y + (Math.sin(i) * radius))
  i += ( Math::PI * 2.0 ) / num_vertices
end

i = 0
num_vertices.times do
  the_lines << Line.new(circle_vertices[i], circle_vertices[(i + 1) % num_vertices])
  i += 1
end

the_screen.render(the_lines)