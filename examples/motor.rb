if __FILE__ == $0
  $:.unshift File.join(File.dirname(__FILE__),'..','lib')
end

require 'ev3dev'

m = Ev3dev::Motor.new :B
p m.device_path
p "run mode: #{m.run_mode}"
m.run_mode :time
m.duty_cycle_sp 50
m.time_sp 1000
m.go