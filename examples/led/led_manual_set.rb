#!/usr/bin/ruby

# https://github.com/ev3dev/ev3dev/wiki/Using-the-LEDs

require 'ev3dev'

led = Ev3dev::Led.new
led.off

puts "led.left_green.paths"
puts  led.left_green.paths
sleep 2
puts

puts "led.left_green.max_brightness"
puts  led.left_green.max_brightness    #=> 255
puts
puts "led.left_green.brightness 50"
led.left_green.brightness 50
puts  led.left_green.brightness        #=> 50
sleep 2
puts
puts

puts "led.left_green.trigger"
puts  led.left_green.trigger
#=> [none] mmc0 timer heartbeat default-on transient legoev3-battery-charging-or-full legoev3-battery-charging legoev3-battery-full legoev3-battery-charging-blink-full-solid rfkill0
sleep 2
puts

puts "led.left_green.trigger 'timer'"
led.left_green.trigger 'timer'
puts  led.left_green.trigger
#=> none mmc0 [timer] heartbeat default-on transient legoev3-battery-charging-or-full legoev3-battery-charging legoev3-battery-full legoev3-battery-charging-blink-full-solid rfkill0
sleep 3
puts

puts "led.left_green.delay_on"
puts  led.left_green.delay_on          #=> 500
sleep 3
puts

puts "led.left_green.delay_on 1000"
led.left_green.delay_on 1000
puts  led.left_green.delay_on          #=> 1000
sleep 6
puts
puts

puts "led.left_green.delay_off"
led.left_green.delay_off
puts  led.left_green.delay_off         #=> 500
sleep 3
puts

puts "led.left_green.delay_off 1000"
led.left_green.delay_off 1000
puts  led.left_green.delay_off         #=> 1000
sleep 6
puts

puts "led.left_green.trigger 'none'"
led.left_green.trigger 'none'
