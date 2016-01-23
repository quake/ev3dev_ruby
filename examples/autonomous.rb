#!/usr/bin/ruby

require 'ev3dev'

touch = Ev3dev::Sensor.new 1

lm_b = Ev3dev::Motor.new 'B'
lm_c = Ev3dev::Motor.new 'C'

lm_b.stop_command 'brake'
lm_b.duty_cycle_sp 50

lm_b.stop_command 'brake'
lm_c.duty_cycle_sp -50

puts 'Plese press Touch Sensor to start'
while touch.value0.to_i == 0
  sleep 0.1
end

lm_b.command 'run-forever'
lm_c.command 'run-forever'

sleep 0.2

puts 'Plese press Touch Sensor to stop'
while touch.value0.to_i == 0
  sleep 0.1
end

lm_b.command 'stop'
lm_c.command 'stop'
