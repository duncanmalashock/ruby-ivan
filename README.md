[![Build Status](https://travis-ci.org/duncanmalashock/ivan.svg?branch=master)](https://travis-ci.org/duncanmalashock/ivan)
[![Code Climate](https://codeclimate.com/repos/5590faabe30ba052da00607c/badges/7726cf22d3b586bd14fa/gpa.svg)](https://codeclimate.com/repos/5590faabe30ba052da00607c/feed)
[![Test Coverage](https://codeclimate.com/repos/5590faabe30ba052da00607c/badges/7726cf22d3b586bd14fa/coverage.svg)](https://codeclimate.com/repos/5590faabe30ba052da00607c/coverage)

# ivan

_ivan_ is a Ruby library for creating imagery on analog [vector monitors](https://en.wikipedia.org/wiki/Vector_monitor), using [@osresearch](https://github.com/osresearch)'s [teensyv](https://github.com/osresearch/teensyv) control firmware.

### Features ###
_ivan_ currently handles:

* Creating new Glyphs (instantiations of geometric models)
* Scaling & translating Glyphs
* 3D perspective projection & rotation
* Composition of Glyphs inside each other
* Determining whether output is screen-safe
* Saving/loading geometry data to/from Yaml files
* Serial port output to hardware via USB

### To Do
* Test coverage – Right now I'm using Minitest with a combination of assertions and spec style. This needs help.
* Line clipping using the [Cohen-Sutherland](https://en.wikipedia.org/wiki/Cohen%E2%80%93Sutherland_algorithm) algorithm or something similar
* Gemify

### Installation
_ivan_ isn't a gem...yet. But it will be soon. For now, if you want to try it out/run the tests,

1. Clone/download the repo
2. Run *bundle install*
3. Create test applications inside the project directory, requiring the 'ivan.rb' file.

### Example Application
Because of hardware dependencies, you probably won't get an application running for now unless you're me or [@osresearch](https://github.com/osresearch). In the meantime for the curious, my implementation talks to a [Teensy 3.1](https://www.pjrc.com/teensy/teensy31.html) running the [teensyv](https://github.com/osresearch/teensyv) program via its serial input. You'll need a USB connection (with its device path correctly specified) to a Teensy 3.1 running the teensyv C code.
```
require_relative 'ivan'

Ivan.set_model_path("#{ File.dirname($0) }/models/")
sender1 = TeensyVSender.new({ port: "/dev/tty.usbmodem54121" })
Ivan.load_model(:cube)

glyph1 = Glyph.new_from_model(:cube)
buffer1 = glyph1 \
  .scale([40,40,40]) \
  .rotate_y(0.3) \
  .project \
  .translate_2D([128, 128]) \
  .instructions
   
sender1.send_buffer(buffer1)
```

### Why Vector Monitors? ###
Ever seen one? They're awesome. Vector monitors used to be _the_ way to display computer graphics from the 1960s up until the mid-80s, when framebuffer technology advanced to the point where vector display quality was no longer competitive.

But even though they're totally outmoded, vector monitors still have something pixel-based monitors don't: 

1. Infinite resolution. Vector lines are perfectly smooth, like ink on a page.
2. The brightness of the images on the screen makes drawing and animating even simple shapes exciting.

Vector graphics were used in:

* Early arcade games like [Asteroids](https://en.wikipedia.org/wiki/Asteroids_(video_game)) and [Tempest](https://en.wikipedia.org/wiki/Tempest_(video_game))
* The [Rebel Briefing scene](https://www.youtube.com/watch?v=yMeSw00n3Ac) in Star Wars IV: A New Hope, programmed by [Larry Cuba](http://www.well.com/~cuba/Filmography.html)
* The abstract films of [John Whitney](https://www.google.com/search?q=john+whitney&espv=2&biw=1189&bih=810&source=lnms&tbm=isch&sa=X&ei=M6mRVabKA5agyATQ7a-oAg&ved=0CAcQ_AUoAg&dpr=1)
* The [Sketchpad](https://www.youtube.com/watch?v=T7dC98PNxyE) system designed in 1963 by user interface and Object-Oriented software pioneer [Ivan Sutherland](https://en.wikipedia.org/wiki/Ivan_Sutherland)

Currently, vector graphics also have relevant applications in [laser shows](https://en.wikipedia.org/wiki/Laser_lighting_display).

![vector_scope_1](https://cloud.githubusercontent.com/assets/3036676/8416647/1fec54ac-1e75-11e5-8aec-42038337900f.jpg)
My current setup, using a modified [Vectrex](https://en.wikipedia.org/wiki/Vectrex) console and [@osresearch](https://github.com/osresearch)'s [teensyv](https://github.com/osresearch/teensyv) control circuit.

### License
MIT