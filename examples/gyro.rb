#!/usr/bin/ruby

# LEGO EV3 Gyro Sensor (45505)
# http://www.ev3dev.org/docs/sensors/
# http://www.ev3dev.org/docs/sensors/lego-ev3-gyro-sensor/
# http://www.ev3dev.org/docs/drivers/lego-sensor-class/

require 'ev3dev'

gyro = Ev3dev::Sensor.new 2

p gyro.device_path  #=> "/sys/class/lego-sensor/sensor4"
p gyro.driver_name  #=> "lego-ev3-gyro"
p gyro.address      #=> "in2"
p gyro.modes        #=> "GYRO-ANG GYRO-RATE GYRO-FAS GYRO-G&A GYRO-CAL TILT-RATE TILT-ANG"
p gyro.mode         #=> "GYRO-ANG"

gyro.mode 'GYRO-G&A'

p gyro.mode         #=> "GYRO-G&A"
p gyro.num_values   #=> "2"
p gyro.value0.to_i  #=> 0
p gyro.value1.to_i  #=> 0

50.times do
  puts "Angle: #{gyro.value0}, Rotational Speed: #{gyro.value1}"
  sleep 0.1
end
