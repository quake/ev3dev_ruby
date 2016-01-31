#!/usr/bin/ruby

# https://github.com/ev3dev/ev3dev/wiki/Using-Sound

require 'ev3dev'

sound = Ev3dev::Sound.new

p sound.device_path   #=> "/sys/devices/platform/snd-legoev3"
p sound.mode          #=> "idle"; idle, tone or pcm
p sound.volume        #=> "75"
sound.volume 10
p sound.volume        #=> "9"
p sound.tone          #=> "0"

sound.tone 440, 1000  # 440Hz, 1000ms(1sec)
sleep 3

sound.tone 1000       # 1000Hz, endless
sleep 2
sound.tone 0          # stop
