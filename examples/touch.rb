#!/usr/bin/ruby

# LEGO EV3 Touch Sensor (45507)
# http://www.ev3dev.org/docs/sensors/
# http://www.ev3dev.org/docs/sensors/lego-ev3-touch-sensor/
# http://www.ev3dev.org/docs/drivers/lego-sensor-class

require 'ev3dev'

touch = Ev3dev::Sensor.new 1

p touch.device_path  #=> "/sys/class/lego-sensor/sensor0"
p touch.driver_name  #=> "lego-ev3-touch"
p touch.address      #=> "in1"
p touch.modes        #=> "TOUCH"
p touch.mode         #=> "TOUCH"
p touch.num_values   #=> "1"
p touch.value0.to_i  #=> 0   # 0:not pushed 1:pushed


lm_b = Ev3dev::Motor.new 'B'
lm_c = Ev3dev::Motor.new 'C'

lm_b.duty_cycle_sp 30
lm_c.duty_cycle_sp 30

lm_b.command 'run-forever'
lm_c.command 'run-forever'

puts 'Plese press Touch Sensor to stop'
loop do
  if touch.value0.to_i == 1
    lm_b.command 'stop'
    lm_c.command 'stop'
    break
  end
  sleep 0.1
end
