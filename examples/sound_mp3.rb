#!/usr/bin/ruby

# https://github.com/ev3dev/ev3dev/wiki/Using-Sound

# You should install mpg123 player.
# robot@ev3dev:~$ sudo apt-get install mpg123
# Example: Playing back sample.mp3 file

require 'ev3dev'

sound = Ev3dev::Sound.new

p sound.device_path  #=> "/sys/devices/platform/snd-legoev3"
p sound.mode         #=> "idle"; idle, tone or pcm
p sound.volume       #=> "75"
sound.volume 10
p sound.volume       #=> "9"

sound.mpg123 'sample.mp3'
sleep 3

sound.mpg123 '-2 sample.mp3'  # downsample rate 1/2 (22 kHz)
sleep 3
