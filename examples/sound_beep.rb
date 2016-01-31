#!/usr/bin/ruby

# https://github.com/ev3dev/ev3dev/wiki/Using-Sound
# http://manpages.debian.org/cgi-bin/man.cgi?query=BEEP&sektion=1&apropos=0&manpath=Debian+7.0+wheezy&locale=

require 'ev3dev'

sound = Ev3dev::Sound.new

p sound.device_path  #=> "/sys/devices/platform/snd-legoev3"
p sound.mode         #=> "idle"; idle, tone or pcm
p sound.volume       #=> "75"
sound.volume 10
p sound.volume       #=> "9"

sound.beep           # 440Hz 200ms
sleep 2

sound.beep '-f 200 -l 500' # 220Hz 500ms
sleep 2

sound.beep "-f 262 -l 180 -d 20 -r 2 \
-n -f 392 -l 180 -d 20 -r 2 \
-n -f 440 -l 180 -d 20 -r 2 \
-n -f 392 -l 380 -d 20 \
-n -f 349 -l 180 -d 20 -r 2 \
-n -f 330 -l 180 -d 20 -r 2 \
-n -f 294 -l 180 -d 20 -r 2 \
-n -f 262 -l 400"
           # twinkle twinkle little star"
