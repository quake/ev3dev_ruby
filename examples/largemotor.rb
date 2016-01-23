#!/usr/bin/ruby

# LEGO EV3 Large Servo Motor (45502)
# http://www.ev3dev.org/docs/motors/
# http://www.ev3dev.org/docs/motors/lego-ev3-large-servo-motor/
# http://www.ev3dev.org/docs/drivers/tacho-motor-class/

require 'ev3dev'

lm_b = Ev3dev::Motor.new 'B'
lm_c = Ev3dev::Motor.new 'C'

p lm_b.device_path   #=> "/sys/class/tacho-motor/motor0"
p lm_b.driver_name   #=> "lego-ev3-l-motor"
p lm_b.address       #=> "outB"
p lm_b.commands      #=> "run-forever run-to-abs-pos run-to-rel-pos run-timed run-direct stop reset"
p lm_b.stop_commands #=> "coast brake hold"
p lm_b.stop_command  #=> "coast"


lm_b.stop_command 'brake'
lm_b.duty_cycle_sp 50
lm_b.time_sp 2000

lm_c.stop_command 'brake'
lm_c.duty_cycle_sp 50
lm_c.time_sp 2000

lm_b.command 'run-timed'
lm_c.command 'run-timed'

sleep 4

lm_b.duty_cycle_sp -50
lm_b.time_sp 2000

lm_c.duty_cycle_sp -50
lm_c.time_sp 2000

lm_b.command 'run-timed'
lm_c.command 'run-timed'
sleep 4

lm_b.command 'reset'
lm_c.command 'reset'

lm_b.stop_command 'brake'
lm_b.position_sp 360
lm_b.duty_cycle_sp 60

lm_c.stop_command 'brake'
lm_c.position_sp -360
lm_c.duty_cycle_sp 60

lm_b.command 'run-to-rel-pos'
lm_c.command 'run-to-rel-pos'
sleep 4

lm_b.position_sp 0
lm_c.position_sp 0

lm_b.command 'run-to-abs-pos'
lm_c.command 'run-to-abs-pos'
sleep 4
