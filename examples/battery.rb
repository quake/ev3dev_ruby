#!/usr/bin/ruby

# https://github.com/ev3dev/ev3dev/issues/68

require 'ev3dev'

batt = Ev3dev::Battery.new

p batt.device_path  #=> "/sys/class/power_supply/legoev3-battery"
puts batt.uevent
#=> POWER_SUPPLY_NAME=legoev3-battery
#=> POWER_SUPPLY_STATUS=Discharging
#=> POWER_SUPPLY_PRESENT=1
#=> POWER_SUPPLY_TECHNOLOGY=Li-ion
#=> POWER_SUPPLY_VOLTAGE_MAX_DESIGN=7500000
#=> POWER_SUPPLY_VOLTAGE_MIN_DESIGN=7100000
#=> POWER_SUPPLY_VOLTAGE_NOW=8295133
#=> POWER_SUPPLY_CURRENT_NOW=142666
#=> POWER_SUPPLY_CHARGE_FULL_DESIGN=2050000
#=> POWER_SUPPLY_CHARGE_NOW=2050000
#=> POWER_SUPPLY_SCOPE=System

p batt.voltage_now.to_i  #=> 8295133
