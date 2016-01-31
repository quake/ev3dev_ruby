module Ev3dev
  class Sound < Device
    PATH = "/sys/devices/platform"

    def initialize()
      Dir.glob("#{PATH}/*").each do |path|
        if File.exist?("#{path}/tone")
          super path
          return
        end
      end
      raise "couldn't find sound attributes"
    end

    def tone(*args)
      raise "couldn't find sound attributes" if @device_path.nil?
      param = File.join @device_path, "tone"
      raise "no such attribute: #{param}" unless File.exist? param
      if args.first.nil?
        IO.read(param).strip
      else
        IO.write param, args.join(" ")
        self
      end
    end

    def beep(*args)
      `beep #{args.first}`
    end

    def aplay(*args)
       `aplay #{args.first}`
    end

    def espeak(arg)
      `espeak #{arg} --stdout | aplay`
    end

    def mpg123(*args)
      `mpg123 #{args.first}`
    end
  end
end
