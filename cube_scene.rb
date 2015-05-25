require_relative "lib/ivan"

input_device = UniMIDI::Input.first
vs = {
  :x_pos=>0, 
  :y_pos=>0, 
  :z_pos=>14.1875,
  :x_rot=>-0.453125, 
  :y_rot=>0.984375, 
  :z_rot=>0.1875, 
  :focal=>13.5625
}

def midi_input_loop(input_device, vs)
  while true do
    m = input_device.gets
    message = m[0][:data]
    channel = (message[0].to_s + message[1].to_s).to_i
    val = message[2]
    case channel
      # Position controls
      when 1768
        vs[:x_pos] = (message[2] - 64) / 32.0
      when 1769
        vs[:y_pos] = (message[2] - 64) / 32.0
      when 17610
        vs[:z_pos] = (message[2]) * 20.0 / 64.0 + 2.0
      # Rotation controls
      when 17623
        vs[:x_rot] = (message[2] - 64) / 64.0
      when 17624
        vs[:y_rot] = (message[2] - 64) / 64.0
      when 17625
        vs[:z_rot] = (message[2] - 64) / 64.0
      # Focal length
      when 17616
        vs[:focal] = message[2] / 64.0 * 20 + 2.0
      else
    end
    puts "#{channel}"
    puts "#{vs}"
    draw(vs)
  end
end

def draw(vs)
  cubes = []
  a_cube = Cube.new
  a_cube.rotate_x(vs[:x_rot])
  a_cube.rotate_y(vs[:y_rot])
  a_cube.rotate_z(vs[:z_rot])
  a_cube.translate([vs[:x_pos],vs[:y_pos],vs[:z_pos]])
  cubes << a_cube
  a_view = View.new(cubes, vs[:focal])
  a_renderer = Renderer.new
  # puts a_view.class
  # puts a_view.inspect
  a_renderer.render(a_view)
end

midi_input_loop(input_device, vs)