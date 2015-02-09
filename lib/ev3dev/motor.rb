module Ev3dev
  class Motor < Device
    PATH = "/sys/class/tacho-motor"

    def initialize(port)
      Dir.glob("#{PATH}/motor*").each do |path|
        if IO.read("#{path}/port_name").strip == "out#{port.to_s.upcase}"
          super path
          return
        end
      end
    end

    def go
      run 1
    end

    def stop
      run 0
    end
  end
end