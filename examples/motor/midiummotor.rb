#!/usr/bin/ruby

# LEGO EV3 Medium Servo Motor (45503)
# http://www.ev3dev.org/docs/motors/
# http://www.ev3dev.org/docs/motors/lego-ev3-medium-servo-motor/
# http://www.ev3dev.org/docs/drivers/tacho-motor-class/

require 'ev3dev'

mm = Ev3dev::Motor.new 'A'

p mm.device_path    #=> "/sys/class/tacho-motor/motor0"
p mm.driver_name    #=> "lego-ev3-m-motor"
p mm.address        #=> "outA"
p mm.commands       #=> "run-forever run-to-abs-pos run-to-rel-pos run-timed run-direct stop reset"
p mm.stop_commands  #=> "coast brake hold"
p mm.stop_command   #=> "coast"


mm.duty_cycle_sp 100
mm.command 'run-forever'
sleep 3
mm.command 'stop'

mm.duty_cycle_sp -100
mm.command 'run-forever'
sleep 3
mm.command 'stop'
