#!/usr/bin/ruby

require 'ev3dev'

touch = Ev3dev::Sensor.new 1
col   = Ev3dev::Sensor.new 3
col.mode 'COL-REFLECT'

lm_b = Ev3dev::Motor.new 'B'
lm_c = Ev3dev::Motor.new 'C'

puts 'Plese press Touch Sensor to start'
while touch.value0.to_i == 0
  sleep 0.1
end

sleep 0.2

puts 'Plese press Touch Sensor to stop'
while touch.value0.to_i == 0
  if col.value0.to_i > 30     # White
    lm_b.duty_cycle_sp 10
    lm_c.duty_cycle_sp 30
    lm_b.command 'run-forever'
    lm_c.command 'run-forever'
  else
    lm_b.duty_cycle_sp 30
    lm_c.duty_cycle_sp 10
    lm_b.command 'run-forever'
    lm_c.command 'run-forever'
  end
  sleep 0.1
end

lm_b.command 'stop'
lm_c.command 'stop'
