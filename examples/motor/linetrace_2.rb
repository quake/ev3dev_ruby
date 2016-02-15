#!/usr/bin/ruby

require 'ev3dev'

touch = Ev3dev::Sensor.new 1
col   = Ev3dev::Sensor.new 3
col.mode 'COL-REFLECT'

lm_b = Ev3dev::Motor.new 'B'
lm_c = Ev3dev::Motor.new 'C'

lm_b.stop_command 'brake'
lm_c.stop_command 'brake'

puts 'Plese press Touch Sensor to start'
while touch.value0.to_i == 0
  sleep 0.1
end

sleep 0.2

lm_b.duty_cycle_sp 0
lm_c.duty_cycle_sp 0
lm_b.command 'run-direct'
lm_c.command 'run-direct'

puts 'Plese press Touch Sensor to stop'
while touch.value0.to_i == 0
  p brihgtness = col.value0.to_i
  if brihgtness > 30     # White
    lm_b.duty_cycle_sp 10
    lm_c.duty_cycle_sp 40
  else
    lm_b.duty_cycle_sp 40
    lm_c.duty_cycle_sp 10
  end
  sleep 0.02
end

lm_b.command 'stop'
lm_c.command 'stop'

