module Ev3dev
  class Sensor < Ev3dev::Device
    PATH = "/sys/class/msensor"

    def initialize(port)
      Dir.glob("#{PATH}/sensor*").each do |path|
        if IO.read("#{path}/port_name").strip == "in#{port.to_s}"
          super path
          return
        end
      end
    end
  end
end