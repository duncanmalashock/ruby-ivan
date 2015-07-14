[![Build Status](https://travis-ci.org/duncanmalashock/ivan.svg?branch=master)](https://travis-ci.org/duncanmalashock/ivan)
[![Code Climate](https://codeclimate.com/github/duncanmalashock/ivan/badges/gpa.svg)](https://codeclimate.com/github/duncanmalashock/ivan)
[![Test Coverage](https://codeclimate.com/github/duncanmalashock/ivan/badges/coverage.svg)](https://codeclimate.com/github/duncanmalashock/ivan/coverage)

# ivan

_ivan_ is a Ruby library for creating imagery on analog [vector monitors](https://en.wikipedia.org/wiki/Vector_monitor), using [@osresearch](https://github.com/osresearch)'s [teensyv](https://github.com/osresearch/teensyv) control firmware.

### Features ###
_ivan_ currently handles:

* Saving/loading geometry data to/from Yaml files
* Creating new Glyphs (instantiations of geometric models)
* Scaling & translating Glyphs
* 3D perspective projection & rotation
* Composition of Glyphs inside each other
* Testing whether output is screen-safe
* Clipping lines to a boundary
* Serial port output to hardware via USB

### To Do
* Test coverage – Right now I'm using Minitest with a combination of assertions and spec style. This needs help.

### Installation
```
require 'ivan'
```

### Example Application
Because of hardware dependencies, you probably won't get an application running for now unless you're me or [@osresearch](https://github.com/osresearch). Although Sender subclasses can be written to send to a device of your choice, my TeensyVSender implementation talks to a [Teensy 3.1](https://www.pjrc.com/teensy/teensy31.html) running the [teensyv](https://github.com/osresearch/teensyv) program via its serial input. To do likewise, you'll need a USB connection to a Teensy 3.1 running the teensyv C code, and to assign its device path to the value of the "port" key in the TeensyVSender constructor. Confused? Good!
```
require 'ivan'

output = TeensyVSender.new({
  port: "/dev/tty.usbmodem54121"
})
Ivan.load_models(:cube)

buffer = Glyph.new_from_model(:cube) \
  .scale([90,90,90])
  .rotate_y(0.52) \
  .rotate_x(0.79) \
  .project \
  .to_buffer

comp = Composition.new(buffer) \
  .normalize(output.boundary)
output.send(comp.buffer)
```

### Why Vector Monitors? ###
Ever seen one? They're awesome. Vector monitors used to be _the_ way to display computer graphics from the 1960s up until the mid-80s, when framebuffer technology advanced to the point where vector display quality was no longer competitive.

But even though they're totally outmoded, vector monitors still have something pixel-based monitors don't. Vector lines are perfectly smooth, like ink on a page, and the brightness of the images on the screen makes even dumb simple shapes look great.

Vector graphics were used in:

* Early arcade games like [Asteroids](https://en.wikipedia.org/wiki/Asteroids_(video_game)) and [Tempest](https://en.wikipedia.org/wiki/Tempest_(video_game))
* The [Rebel Briefing scene](https://www.youtube.com/watch?v=yMeSw00n3Ac) in Star Wars IV: A New Hope, programmed by [Larry Cuba](http://www.well.com/~cuba/Filmography.html)
* The abstract films of [John Whitney](https://www.google.com/search?q=john+whitney&espv=2&biw=1189&bih=810&source=lnms&tbm=isch&sa=X&ei=M6mRVabKA5agyATQ7a-oAg&ved=0CAcQ_AUoAg&dpr=1)
* The [Sketchpad](https://www.youtube.com/watch?v=T7dC98PNxyE) system designed in 1963 by user interface and Object-Oriented software pioneer [Ivan Sutherland](https://en.wikipedia.org/wiki/Ivan_Sutherland)

![vector_scope_1](https://cloud.githubusercontent.com/assets/3036676/8416647/1fec54ac-1e75-11e5-8aec-42038337900f.jpg)
My current setup, using a modified [Vectrex](https://en.wikipedia.org/wiki/Vectrex) console and [@osresearch](https://github.com/osresearch)'s [teensyv](https://github.com/osresearch/teensyv) control circuit.