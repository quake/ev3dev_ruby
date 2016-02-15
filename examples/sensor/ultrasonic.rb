#!/usr/bin/ruby

# LEGO EV3 Ultrasonic Sensor (45504)
# http://www.ev3dev.org/docs/sensors/
# http://www.ev3dev.org/docs/sensors/lego-ev3-ultrasonic-sensor/
# http://www.ev3dev.org/docs/drivers/lego-sensor-class

require 'ev3dev'

us = Ev3dev::Sensor.new 4

p us.device_path  #=> "/sys/class/lego-sensor/sensor1"
p us.driver_name  #=> "lego-ev3-us"
p us.address      #=> "in4"
p us.modes        #=> "US-DIST-CM US-DIST-IN US-LISTEN US-SI-CM US-SI-IN US-DC-CM US-DC-IN"
p us.mode         #=> "US-DIST-CM"
p us.num_values   #=> "1"
p us.value0.to_i  #=> 913


lm_b = Ev3dev::Motor.new 'B'
lm_c = Ev3dev::Motor.new 'C'

lm_b.stop_command 'brake'
lm_b.duty_cycle_sp 50

lm_c.stop_command 'brake'
lm_c.duty_cycle_sp 50

lm_b.command 'run-forever'
lm_c.command 'run-forever'

while us.value0.to_i > 150
  puts us.value0
end

lm_b.command 'stop'
lm_c.command 'stop'
