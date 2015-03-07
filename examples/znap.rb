#!/usr/bin/ruby
if __FILE__ == $0
  $:.unshift File.join(File.dirname(__FILE__),'..','lib')
end

require 'ev3dev'

m1 = Ev3dev::Motor.new :A
m1.run_mode :time

m2 = Ev3dev::Motor.new :B
m2.run_mode :time

m3 = Ev3dev::Motor.new :D
m3.run_mode :time

s1 = Ev3dev::Sensor.new 3

t1 = Thread.new do
  loop do
    m2.duty_cycle_sp 50
    m2.time_sp 500

    m3.duty_cycle_sp -50
    m3.time_sp 500

    m2.go
    m3.go

    sleep rand(1.5..1.9)

    m2.duty_cycle_sp -50
    m2.time_sp 500

    m3.duty_cycle_sp 50
    m3.time_sp 500

    m2.go
    m3.go
    sleep rand(1.5..1.9)

    m2.duty_cycle_sp -50
    m2.time_sp 1000
    
    m3.duty_cycle_sp -50
    m3.time_sp 1000

    m2.go
    m3.go
    sleep rand(2.0..2.5)
  end
end

t2 = Thread.new do
  loop do
    distance = s1.value0.to_i
    if distance < 400
      m1.duty_cycle_sp -100
      m1.time_sp 300
      m1.go
      sleep rand(1.5..1.9)
      m1.duty_cycle_sp 50
      m1.time_sp 500
      m1.go
      sleep rand(1.5..1.9)
    end
  end
end

t1.join
t2.join
