#!/usr/bin/ruby

# LEGO EV3 Color Sensor (45506)
# http://www.ev3dev.org/docs/sensors/
# http://www.ev3dev.org/docs/sensors/lego-ev3-color-sensor/
# http://www.ev3dev.org/docs/drivers/lego-sensor-class/

require 'ev3dev'

col = Ev3dev::Sensor.new 3

p col.device_path  #=> "/sys/class/lego-sensor/sensor2"
p col.driver_name  #=> "lego-ev3-color"
p col.address      #=> "in3"
p col.modes        #=> "COL-REFLECT COL-AMBIENT COL-COLOR REF-RAW RGB-RAW COL-CAL"
p col.mode         #=> "COL-REFLECT"

col.mode 'COL-REFLECT'

p col.mode         #=> "COL-REFLECT"
p col.num_values   #=> "1"
p col.value0.to_i  #=> 93


50.times do
  puts col.value0.to_i
  sleep 0.1
end
