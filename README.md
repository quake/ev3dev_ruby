# ev3dev ruby binding for LEGO Mindstorms EV3


ev3dev_ruby is a gem to controll sensors and motors on EV3 using Ruby.

- [ev3dev](http://www.ev3dev.org) version; ev3dev-jessie-2015-12-30 or later


## Install ev3dev_ruby on EV3
SSH remote access to the EV3 from PC

(default ev3dev user; robot,  password; maker)

```
$ ssh robot@ev3dev.local
```



then

```
robot@ev3dev:~$ sudo gem install ev3dev
```

## Run examples
### 1\. Copy the examples to the **/home/robot** directory in ev3dev from PC.

(for OS X user; )
```
$ scp /Users/xxx/Downloads/ev3dev_ruby-master/examples/*.* robot@ev3dev.local:/home/robot
```

### 2\. Run the program
There are two different ways to run the program.
#### A. Remote access from PC

```
robot@ev3dev:~$ cd /home/robot
robot@ev3dev:~$ ruby midiummotor.rb
```

#### B. File Browser on EV3
##### 1. Add execute permission

```
robot@ev3dev:~$ cd /home/robot
robot@ev3dev:~$ ls -l
...
-rw-r--r-- 1 robot robot  474 Jan 18 16:18 midiummotor.rb
...
robot@ev3dev:~$ chmod +x midiummotor.rb
robot@ev3dev:~$ ls -l
...
-rwxr-xr-x 1 robot robot  474 Jan 18 16:18 midiummotor.rb
...
```

##### 2. File Browser
Select the program and push the center button on EV3.


## irb
You can also run programs using irb.
```
robot@ev3dev:~$ irb
irb(main):001:0> require 'ev3dev'
=> true
irb(main):002:0> mm = Ev3dev::Motor.new 'B'
=> #<Ev3dev::Motor:0x193890 @device_path="/sys/class/tacho-motor/motor0">
irb(main):003:0> mm.device_path
=> "/sys/class/tacho-motor/motor0"
irb(main):004:0> mm.driver_name
=> "lego-ev3-l-motor"
irb(main):005:0> mm.address
=> "outB"
irb(main):006:0> mm.commands
=> "run-forever run-to-abs-pos run-to-rel-pos run-timed run-direct stop reset"
irb(main):007:0> mm.stop_commands
=> "coast brake hold"
irb(main):008:0> mm.duty_cycle_sp 100
=> #<Ev3dev::Motor:0x193890 @device_path="/sys/class/tacho-motor/motor0">
irb(main):009:0> mm.command 'run-forever'
=> #<Ev3dev::Motor:0x193890 @device_path="/sys/class/tacho-motor/motor0">
irb(main):010:0> sleep 3

=> 3
irb(main):011:0> mm.command 'stop'
=> #<Ev3dev::Motor:0x193890 @device_path="/sys/class/tacho-motor/motor0">
irb(main):012:0>
```

## ev3dev API
(Also checkout examples)

### [Motors](http://www.ev3dev.org/docs/motors/)
- [EV3 Medium Servo Motor](http://www.ev3dev.org/docs/motors/lego-ev3-medium-servo-motor/)
- [EV3 Large Servo Motor](http://www.ev3dev.org/docs/motors/lego-ev3-large-servo-motor/)
- [Tacho Motor Class API](http://www.ev3dev.org/docs/drivers/tacho-motor-class/)
- [Tacho-Motor Class Tutorial](http://www.ev3dev.org/docs/tutorials/tacho-motors/)

### [Sensors](http://www.ev3dev.org/docs/sensors/)
- [EV3 Touch Sensor](http://www.ev3dev.org/docs/sensors/lego-ev3-touch-sensor/)
- [EV3 Color Sensor](http://www.ev3dev.org/docs/sensors/lego-ev3-color-sensor/)
- [EV3 Gyro Sensor](http://www.ev3dev.org/docs/sensors/lego-ev3-gyro-sensor/)
- [EV3 Ultrasonic Sensor](http://www.ev3dev.org/docs/sensors/lego-ev3-ultrasonic-sensor/)
- [LEGO Sensor Class API](http://www.ev3dev.org/docs/drivers/lego-sensor-class/)

### EV3 Devices

- [Battery](https://github.com/ev3dev/ev3dev/issues/68)
- [Sound](https://github.com/ev3dev/ev3dev/wiki/Using-Sound)
  - [aplay (ALSA sound driver)](http://linux.die.net/man/1/aplay)
  - [espeak (speech engine)](http://espeak.sourceforge.net/commands.html)


#### These EV3 devices below are not supported yet.

- [LCD](http://www.ev3dev.org/docs/tutorials/using-ev3-lcd/)
- [Buttons](http://www.ev3dev.org/docs/tutorials/using-ev3-buttons/)
- [LEDs](https://github.com/ev3dev/ev3dev/wiki/Using-the-LEDs)
- [Bluetooth](https://github.com/ev3dev/ev3dev/wiki/Using-Bluetooth)


## More Info
- [Getting Started with ev3dev - ev3dev.org](http://www.ev3dev.org/docs/getting-started/)
