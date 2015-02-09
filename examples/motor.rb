if __FILE__ == $0
  $:.unshift File.join(File.dirname(__FILE__),'..','lib')
end

require 'ev3dev'

m = Ev3dev::Motor.new :A
p m.dev_path
p "run mode: #{m.run_mode}"
m.go
sleep 1
m.stop