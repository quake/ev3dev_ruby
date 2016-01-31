#!/usr/bin/ruby

# https://github.com/ev3dev/ev3dev/wiki/Using-Sound
# http://linux.die.net/man/1/aplay

# Example: Playing back my_file.wav file

require 'ev3dev'

sound = Ev3dev::Sound.new

p sound.device_path  #=> "/sys/devices/platform/snd-legoev3"
p sound.mode         #=> "idle"; idle, tone or pcm
p sound.volume       #=> "75"
sound.volume 10
p sound.volume       #=> "9"

sound.aplay 'my_file.wav'
sleep 3

sound.aplay '-d 1 my_file.wav'  # interrupt after 1 second
sleep 3
