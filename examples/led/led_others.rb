#!/usr/bin/ruby

# https://github.com/ev3dev/ev3dev/wiki/Using-the-LEDs

require 'ev3dev'

led = Ev3dev::Led.new

puts led.left_green.paths
puts led.right_red.paths

led.off
sleep 2

led.left_green.trigger 'heartbeat'  #left LED; green, blink at CPU usage
sleep 6
led.left_green.trigger 'none'       #left LED; green, off


led.right_red.trigger 'mmc0'      #right LED; red, blink at SD card activity
sleep 6
led.right_red.trigger 'none'      #right LED; red, off
