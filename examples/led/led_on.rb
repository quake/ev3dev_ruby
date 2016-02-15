#!/usr/bin/ruby

# https://github.com/ev3dev/ev3dev/wiki/Using-the-LEDs

require 'ev3dev'

led = Ev3dev::Led.new

puts led.paths

led.off
sleep 2

led.on         #both LED; default amber(255, 255) (orange)
sleep 2
led.off

led.on 255, 0  #both LED; green(255, 0)
sleep 2
led.off

led.on Ev3dev::Led::RED    #both LED; red(0, 255)
sleep 2
led.off


led.left.on         #left LED; default amber(255, 255) (orange)
sleep 2
led.left.off

led.left.on 0, 255  #left LED; red(0, 255)
sleep 2
led.left.off


led.right.on Ev3dev::Led::GREEN  #right LED; green(255, 0)
sleep 2
led.right.off

led.right.on 255, 255            #right LED; amber(255, 255) (orange)
sleep 2
led.right.off


led.left_green.on        #left LED; green(255)
sleep 2
led.left_green.off

led.left_green.on 10     #left LED; green(10)
sleep 2
led.left_green.off
