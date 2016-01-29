module Ev3dev
  class Battery < Device
    PATH = "/sys/class/power_supply"

    def initialize()
      Dir.glob("#{PATH}/*").each do |path|
        if File.exist?("#{path}/voltage_now")
          super path
          return
        end
      end
      raise "couldn't find battery attributes"
    end
  end
end
