#!/usr/bin/ruby

# https://www.kernel.org/doc/Documentation/leds/ledtrig-transient.txt

require 'ev3dev'

led = Ev3dev::Led.new

puts led.paths

led.off
sleep 2

led.left_green.set_flash    #left green LED; flash timer default(0.1s)
led.left_green.flash
sleep 2

led.left_green.flash
sleep 2

led.left_green.flash
sleep 4


led.left_red.set_flash 20   #left green LED; flash timer 0.2s
led.left_red.flash
sleep 2

led.left_red.flash
sleep 2

led.left_red.flash
