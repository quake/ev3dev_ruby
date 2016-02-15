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

col.mode 'COL-COLOR'

p col.mode         #=> "COL-COLOR"
p col.num_values   #=> "1"
p col.value0.to_i  #=> 6
# 0:none 1:Black 2:Blue 3:Green 4:Yellow 5:Red 6:White 7:Brown

50.times do
  color_num = col.value0.to_i
  case color_num
  when 1
    puts 'Black'
  when 2
    puts 'Blue'
  when 3
    puts 'Green'
  when 4
    puts 'Yellow'
  when 5
    puts 'Red'
  when 6
    puts 'White'
  when 7
    puts 'Brown'
  end
  sleep 0.1
end
