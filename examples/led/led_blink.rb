#!/usr/bin/ruby

# https://github.com/ev3dev/ev3dev/wiki/Using-the-LEDs

require 'ev3dev'

led = Ev3dev::Led.new

puts led.paths

led.off
sleep 2

led.blink Ev3dev::Led::GREEN    #both LED; green(255, 0),default on 500ms/ off 500ms
sleep 6
led.off

sleep 2

led.left.blink          #left LED blink; amber(255, 255), default on/off
sleep 5
led.left.off

led.left.blink 255, 0   #left LED blink; green(255, 0), default on/off
sleep 5
led.left.off

led.left.blink 255, 0, 1000, 1500  #left LED blink; green(255, 0), on 1000ms/ off 1500ms
sleep 10
led.left.off

sleep 2

led.right.blink Ev3dev::Led::RED  #right LED blink; red(0, 255), default on/off
sleep 5
led.right.off

led.right.blink Ev3dev::Led::RED, 750, 250  #right LED blink; red(0, 255), on 750ms/ off 250ms
sleep 10
led.right.off

sleep 2

led.left_green.blink                #left LED blink; green(255), default on/off
sleep 5
led.right.off

led.left_green.blink 10             #left LED blink; green(10),  default on/off
sleep 5
led.right.off

led.left_green.blink 100, 750, 250  #left LED blink; green(100), on 750ms/ off 250ms
sleep 10
led.left.off
